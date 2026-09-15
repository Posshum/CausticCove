/mob/living
	//Internal Var for handling mob spawners. Upon death, they will remove themselves from the mob spawner's total mob_amount.
	var/associated_mob_spawner = null

/obj/structure/mob_spawner
	name = "Mob Spawner"
	desc = "You should not be seeing this. Report this to a dev immediately!"
	max_integrity = 99999999 //Nigh Unbreakable.
	damage_deflection = 99999999

	//What kinds of mobs this mob spawner can spawn.
	var/list/spawnable_mobs

	//What kinds of rare mobs this mob spawner can spawn.
	var/list/rare_spawnable_mobs

	//Internal Var - Contains a value of currently existing mobs.
	var/mob_amount

	//The amount of mobs allowed to be alive at once from this mob spawner. By default is 2.
	var/mob_amount_limit = 2

	//The rate in time between each spawn. By default is 1 minute.
	var/spawn_interval = 1 MINUTES

	//The chance to spawn the mob, by default this is set to 25%.
	var/spawn_chance = 25

	//The amount to increment the next chance to spawn the mob on each failed spawn. By default this is set to 5%.
	var/spawn_chance_increment = 5

	//The chance to spawn a rare mob variant. By default this is set to 5%
	var/rare_spawn_chance = 5

	//The amount to increment the next chance to spawn a rare mob after each failed spawn. By default this is 1%.
	var/rare_spawn_chance_increment = 1

	//The limit to cap the spawn chance for a mob from a mob spawner. By default is 100%
	var/spawn_chance_limit = 100

	//See spawn_chance_limit. By default is 10%
	var/rare_spawn_chance_limit = 10

	//The distance at which to spawn a mob from this mob spawner. By default is 6.
	var/spawn_range = 6

/obj/structure/mob_spawner/Initialize()
	. = ..()
	START_PROCESSING(SSprocessing, src)

	//Sanitization?
	spawn_chance_limit = min(100, spawn_chance_limit)
	rare_spawn_chance_limit = min(100, rare_spawn_chance_limit)

	//Immediately force a spawn upon creation.

/obj/structure/mob_spawner/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	. = ..()

/obj/structure/mob_spawner/attackby(obj/item/I, mob/user, params)
	to_chat(user, span_warning("I can't possibly destroy this!"))
	return FALSE

/obj/structure/mob_spawner/process()
	if(spawn_interval < world.time)
		tick()
		spawn_interval = world.time + initial(spawn_interval)

/obj/structure/mob_spawner/proc/get_safe_spawn_turfs()
	var/list/possible_turfs = list()
	for(var/turf/T in view(spawn_range, src))
		if(T.density)
			continue
		for(var/obj/O in T)
			if(O.density)
				continue
		possible_turfs += T

	return possible_turfs

/obj/structure/mob_spawner/proc/tick()
	if(mob_amount >= mob_amount_limit)
		return //We still have too many mobs, skip for the moment.

	for(var/mob/living/carbon/M in range((spawn_range)))
		if(M in GLOB.player_list)
			if(M.stat >= UNCONSCIOUS)
				return //Try to not spawn around players.

	var/mob_to_spawn

	if(prob(spawn_chance))
		spawn_chance = initial(spawn_chance)
		mob_to_spawn = pick(spawnable_mobs)
	else
		spawn_chance = min(spawn_chance_limit, (spawn_chance + spawn_chance_increment))

	if(!mob_to_spawn) //Only pick a rare mob if the normal mob didn't spawn first.
		if(prob(rare_spawn_chance))
			rare_spawn_chance = initial(rare_spawn_chance)
			mob_to_spawn = pick(rare_spawnable_mobs)
		else
			rare_spawn_chance = min(rare_spawn_chance_limit, (rare_spawn_chance + rare_spawn_chance_increment))

	var/turf/spawn_loc = pick(get_safe_spawn_turfs())
	if(spawn_loc && mob_to_spawn) //Only spawn if we have a mob to spawn.
		new /obj/effect/temp_visual/hunting_phantom/mob_spawner(spawn_loc, mob_to_spawn, null, src)
		mob_amount++

/obj/effect/temp_visual/hunting_phantom/mob_spawner
	name = "approaching threat"
	desc = "Something's coming!!!"
	spawn_delay = 5 SECONDS
	var/phantom_mob_spawner

/obj/effect/temp_visual/hunting_phantom/mob_spawner/Initialize(mapload, target_mob_path, target_rot, mob_spawner)
	phantom_mob_spawner = mob_spawner
	. = ..()

/obj/effect/temp_visual/hunting_phantom/mob_spawner/finalize_spawn()
	var/turf/T = get_turf(src)
	if(T)
		var/mob/living/real_mob = new mob_type_to_spawn(T)
		if(rot_path)
			real_mob.rot_type = rot_path
		real_mob.faction |= "hunting_ambush"
		real_mob.associated_mob_spawner = phantom_mob_spawner

		T.visible_message(span_boldwarning("The [real_mob.name] lunges out from the shadows!"))
		playsound(T, 'sound/items/seedextract.ogg', 100, TRUE)
	qdel(src)
	return
