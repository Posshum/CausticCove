/obj/structure/mob_spawner/rous
	name = "Manhole"
	desc = "An iron lid designed to prevent that nasty sewage water from spilling over. Did you hear a squeak just now...?"
	icon = 'modular_causticcove/icons/obj/manhole.dmi'
	icon_state = "manhole"

	spawn_interval = 15 SECONDS
	mob_amount_limit = 1 //Can rarely spawn oozes and fretensis, so be mindful!

	spawn_chance = 50
	spawn_chance_increment = 25

	rare_spawn_chance = 10
	rare_spawn_chance_increment = 0

	spawn_range = 3

	spawnable_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/bigrat)
	rare_spawnable_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/ooze_blob, /mob/living/simple_animal/hostile/retaliate/rogue/bigrat/gethsmane)
