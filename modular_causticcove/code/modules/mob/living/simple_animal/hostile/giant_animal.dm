/mob/living/simple_animal/hostile/retaliate/rogue/giant
	icon = 'icons/roguetown/mob/monster/vol.dmi'
	name = "Giant Animal"
	desc = "A large, often predatory beast. You shouldn't be seeing this."
	gender = NEUTER
	emote_hear = null
	emote_see = null
	speak_chance = 1
	//turns_per_move = 4 This isn't even used in our codebase but I'll keep it here anyways in case it does break stuff.
	see_in_dark = 6
	move_to_delay = 5 // 0.5s between each step, we're a big beast.
	base_intents = list(/datum/intent/simple/bite/giant)
	botched_butcher_results = list(/obj/item/alch/viscera = 1, /obj/item/alch/sinew = 1, /obj/item/natural/bone = 2)
	butcher_results = list(/obj/item/natural/hide = 2,
						/obj/item/alch/sinew = 2,
						/obj/item/alch/bone = 1,
						/obj/item/alch/viscera = 1,
						/obj/item/natural/bone = 3)
	perfect_butcher_results = list(/obj/item/natural/hide = 2,
						/obj/item/alch/sinew = 2,
						/obj/item/alch/bone = 1,
						/obj/item/alch/viscera = 1,
						/obj/item/natural/bone = 4)
	head_butcher = null //I'll need to add individual heads.
	faction = list("giants", "zombies")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = GIANT_ANIMAL_DEFAULT_HEALTH //Defaults to 400 if we don't have one, basically.
	maxHealth = GIANT_ANIMAL_DEFAULT_HEALTH
	melee_damage_lower = 22 //DAMFACTOR of all giant intents are 1.5x
	melee_damage_upper = 32
	vision_range = 9
	aggro_vision_range = 12 //We WILL HUNT YOU DOWN.
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES //Giant beast. Nothing holds it back.
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	//These will eat bodyparts that may be lost when it attacks, as opposed to the smaller, weaker volf.
	food_type = list(/obj/item/reagent_containers/food/snacks,
					/obj/item/bodypart,
					/obj/item/organ,
					/obj/item/natural/bone,
					/obj/item/natural/hide)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 14
	STASTR = 14
	STASPD = 12
	simple_detect_bonus = 30
	deaggroprob = 0
	defprob = 30 //Bigger, slower, less likely to dodge unless we're a dodgy giant somehow.
	del_on_deaggro = null //Treat these mobs like event enemies. If, and when they spawn, they're a big deal and someone needs to deal with them.
	retreat_health = 0.1 
	food = 0
	//Default wolf sounds. I may want to change these.
	attack_sound = list('sound/vo/mobs/vw/attack (1).ogg','sound/vo/mobs/vw/attack (2).ogg','sound/vo/mobs/vw/attack (3).ogg','sound/vo/mobs/vw/attack (4).ogg')
	dodgetime = 5 SECONDS //Only once every 5 seconds.
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/wolf
	eat_forever = TRUE

	//Will need to adjust once I find a size don't forget me!!!
	pixel_x = -32

/datum/intent/simple/bite/giant
	name = "bite"
	icon_state = "instrike"
	attack_verb = list("takes a huge chunk out of") //No one should see this
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 0
	swingdelay = 6 //Bigger creature, more damager, longer delay. Allow people to *possibly* avoid being hit.
	damfactor = 1.5
	penfactor = 1.2 //More muscle mass, more bite strength.
	candodge = TRUE
	canparry = TRUE
	item_d_type = "stab"
