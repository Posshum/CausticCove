SUBSYSTEM_DEF(nature)
	name = "Nature"
	flags = SS_BACKGROUND

	//We are growing plants everytime this runs, please be careful when adjusting this timer.
	wait = 5 MINUTES

	init_order = INIT_ORDER_NATURE
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	//What plants are currently affected by growth, only if they can be affected by natural growth. This does NOT INCLUDE FARMED PLANTS, only plants found in the world.
	//This list will not, and should not ever, contain Multi-Z Trees due to how they function.
	var/list/plants_affected = list()

	//What turf objects are affected for growth. These turfs actively exist in the world and are added on their initialization by default.
	//Currently only affects grass turfs.
	var/list/turfs_affected = list()

	//List of every branch that are affected for new object placements, such as Zads and Nests, or both Zad and Nest.
	var/list/branches_affected = list()

	//How many plants actually exist in the world. This is used so we don't overgrow past a certain threshold and make EVERY tile have grass on it...
	var/how_many_plants_exist = 0

	//How many objects on branches spawned by this subsystem exist in the world. This is so we don't spawn too many zads on every branch. Hah.
	var/how_many_objects_exist = 0

	//How many points we currently have. This is used for both spawning plants, and branch objects.
	var/cur_points = 0

	//The multiplier we apply to our point cost per plant.
	var/point_multiplier

	//The happiness of nature. If this falls under a certain threshold, the nature subsystem may spawn more evil plants in the world.
	var/nature_happiness = ROUND_START_NATURE_HAPPINESS

/datum/controller/subsystem/nature/Initialize(start_timeofday)
	. = ..()
	nature_happiness = initial(nature_happiness) //Just so that map creation doesn't ... Y'know, fuck shit up.

/datum/controller/subsystem/nature/fire(resumed)
	//This should never happen.
	if(how_many_plants_exist <= 0)
		return

	//Handle Point Growth
	if(cur_points < MAX_NATURE_POINTS)
		//If we have 75880 plants alive, we end up with 320 points.
		//If we have 16520 plants alive, we end up with 1510 points.
		cur_points += clamp(floor((MAX_PLANT_POPULATION / how_many_plants_exist) * GROWTH_DIVISOR), MIN_NATURE_POINTS, MAX_NATURE_POINTS)

	//Handle Point Multiplier based on our current god.
	if(SSgamemode.selected_storyteller in GOOD_PLANT_GODS)
		point_multiplier = GOOD_NATURE_COST

	else if(SSgamemode.selected_storyteller in BAD_PLANT_GODS)
		point_multiplier = BAD_NATURE_COST

	else
		point_multiplier = NORMAL_NATURE_COST //Should always remain as 1 point.

	if(cur_points <= MIN_NATURE_POINTS)
		return //Negative/Zero points, don't continue.

	//Handles normal growth of plants in the world, along with handling different atoms spawning on tree branches.
	handle_growth()

	//Handle plant upgrades, such as grass growing into flowers, or bushes becoming taller bushes, etc.
	handle_upgrades()

	//Handle Happiness. This is important for growth probability and branch probability, the angier or happier Nature is, the higher chance plants will grow of their respective types.
	handle_happiness()

//Handles the spawning of plants and objects on branches.
/datum/controller/subsystem/nature/proc/handle_growth()
	//Check if we can place new objects on turf or branches.
	var/can_plants = TRUE
	var/can_branches = TRUE

	if(how_many_plants_exist > MAX_PLANT_POPULATION)
		can_plants = FALSE //Too many plants!!!

	if(how_many_objects_exist > MAX_BRANCH_OBJECTS)
		can_branches = FALSE //Too many objects!!!

	var/max_attempts = cur_points * point_multiplier
	for(var/i in 1 to max_attempts)
		if(cur_points <= MIN_NATURE_POINTS)
			return //We used up all of our current points!
		cur_points--

		//Handle Plants at a rate equal to nature's happiness, the angrier, or happier, nature is, the more often it will grow plants.
		if(can_plants && prob((abs(nature_happiness))))
			//Pick a random turf from our affected turfs list.
			var/turf/T = pick(turfs_affected)

			//Check if we can enter so we don't spawn shit inside other shit that isn't accessible by normal means. Like trees and logs.
			for(var/obj/O in T.contents)
				if(!O.Enter())
					continue //Object with density located; lets skip it boys.

			//Pick our plant. Checks happiness first before we choose what to spawn and makes a choice based on happiness.
			var/chosen_plant
			//Angy >:(
			if(nature_happiness < DEFAULT_NATURE_HAPPINESS)
				chosen_plant = pick(EVIL_PLANT_OBJECTS)
			//Hapi <:)
			else
				chosen_plant = pick(PLANT_OBJECTS)

			//Actually spawn the plant now.
			new chosen_plant(T)

		//Handle Branches
		else if(can_branches && prob(abs(nature_happiness)))
			//Pick a random branch from our affected branches list.
			var/obj/structure/flora/newbranch/B = pick(branches_affected)

			//Pick our object. Checks happiness first before we choose what to spawn and makes a choice based on happiness.
			var/chosen_object
			//Angy >:(
			if(nature_happiness < DEFAULT_NATURE_HAPPINESS)
				chosen_object = pick(EVIL_BRANCH_OBJECTS)
			//Hapi <:)
			else
				chosen_object = pick(BRANCH_OBJECTS)

			//Actually spawn the object now.
			var/branch_object = new chosen_object(get_turf(B))
			AddComponent(/datum/component/branch_object_tracker, branch_object)

/datum/controller/subsystem/nature/proc/handle_happiness()
	//The more unhappy we are, the more we decay to normal happiness.
	if(nature_happiness < DEFAULT_NATURE_HAPPINESS)
		nature_happiness /= SADNESS_DECAY_DIVISOR
		nature_happiness++ //Add 1 point at a flat rate to ensure we don't slow down too much when nearing 0.

	//The resting limit of happiness. Increase to the upper limit if we are back at a state we can begin being happy.
	else if(nature_happiness < RESTING_LIMIT_NATURE_HAPPINESS)
		nature_happiness += 20

//Handle Plant Upgrades
/datum/controller/subsystem/nature/proc/handle_upgrades()
	for(var/i in 1 to length(plants_affected))
		//The more bored the forest is, the less we wanna upgrade. If Happiness is 10 - 100, 90 prob to return.
		if(prob((abs(nature_happiness) - MAX_NATURE_HAPPINESS)))
			return

		if(i < length(plants_affected))
			var/obj/structure/flora/cur_plant = plants_affected[rand(length(plants_affected))]
			cur_plant.attempt_upgrade()


//Allowed in the turf list? Blotch it on there then!
/datum/controller/subsystem/nature/proc/attempt_add_to_turf_list(turf/T)
	if(T.type in ALLOWED_TURFS)
		turfs_affected += T

//Component used for handling object tracking. Does nothing else otherwise.
/datum/component/branch_object_tracker/proc/remove_self()
	SSnature.how_many_objects_exist--

/datum/component/branch_object_tracker/Initialize(...)
	. = ..()
	SSnature.how_many_objects_exist++ //If we can add this to the object, we track it.

	//We got destroyed. Remove us.
	RegisterSignal(parent, COMSIG_PARENT_QDELETING, .proc/remove_self)

	//Someone picked us up. Remove us.
	RegisterSignal(parent, COMSIG_ITEM_PICKUP, .proc/remove_self)
