//Custom Sprites for this would be amazing... But I am not talented enough for that.
/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/heavy/hunters
	name = "Piercer's Crossbow"
	desc = "The close relative to the Siegebow, this crossbow is fitted with a heavy draw similarly to that of a Siegebow! It's only drawback however is its slightly smaller bolts, specifically designed in slaying beasts and man alike without much of the strengths of taking down structures and walls alike."
	mag_type = /obj/item/ammo_box/magazine/internal/shot/piercers_crossbow
	minstr = 11 //Just a smidge weaker than normal siegebow since they cannot break down terrain.
	force = 14
	wdefense = 7 //HBG's are pretty solid shields ironically enough.
	max_integrity = 200
	chargingspeed = 60 //+20, or a little over +50% the standard charging speed.
	reloadtime = 100 //Faster reload speed, you're using a modified heavy crossbow that *doesn't* break walls or objects very well.
	accfactor = 0.7 //20% better accuracy than Siegebows since it's lighter.
	equip_delay_self = 2 SECONDS //Slightly faster draw rates since it is a little lighter.
	unequip_delay_self = 2 SECONDS
	inv_storage_delay = 1 SECONDS

	cocked = TRUE //Uncraftable, should be loaded by default.

/obj/item/ammo_box/magazine/internal/shot/piercers_crossbow
	ammo_type = /obj/item/ammo_casing/caseless/rogue/piercers_bolt
	caliber = "heabolt"
	max_ammo = 1
	
	start_empty = FALSE // Uncraftable, should be loaded by default.

/obj/item/ammo_casing/caseless/rogue/piercers_bolt
	name = "piercer's bolt"
	desc = "A massive steel bolt that is designed to pierce the hide of any great beast that may stand in its path. Incapable of destroying structures, or walls unlike the Siegebow."
	projectile_type = /obj/projectile/bullet/reusable/piercers_bolt
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	caliber = "heabolt"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "heavybolt" 
	dropshrink = 0.8
	max_integrity = 15
	force = 12
	grid_height = 96 //Effectively as large as a shortsword. Two in a belt, four in a satchel. Unideal for carrying without a purpose-made pouch.
	grid_width = 32
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH //Carry it on the hip or bite down like a carrot, if you're out of options.
	equip_delay_self = 2 SECONDS //Girth. Pack a siege bolt pouch if you want to circumvent it.
	unequip_delay_self = 2 SECONDS
	inv_storage_delay = 1 SECONDS

/obj/projectile/bullet/reusable/piercers_bolt
	name = "piercer's bolt"
	damage = 100 // +30 damage over the regular bolt for a total of 120 damage flat beyond 8 tiles, otherwise damage is halved.
	damage_type = BRUTE
	armor_penetration = PEN_MEDIUM //Less penetration against armor, however, as it's designed for piercing Hides and not Metal.
	object_damage_multiplier = 4 //Not a conventional siegebow. Still possible however.
	wall_impact_break_probability = 0 // Cannot break on impact with walls, but you can only get these in limited amounts as it's role specific. Don't lose it!
	damages_turf_walls = FALSE //Determines whether the bolt can damage turfs or not. By default, yes.
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "heavybolt_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/piercers_bolt
	range = 30
	hitsound = 'sound/combat/hits/hi_bolt (2).ogg'
	embedchance = 100
	woundclass = BCLASS_PIERCE
	flag = "piercing"
	speed = 2.25 //VERY Slow projectile, you're aiming to send as much weight into your opponent as possible to pierce their hide.
	npc_simple_damage_mult = 10 // 10 * 100 = 1000 damage against simple mobs. Most simple mobs will die to this, boss simple mobs may take 2-3 hits from this.
	min_range = 6 //Within 6 tiles you do only 50% damage.
	dam_falloff_factor = 0.5

/obj/projectile/bullet/reusable/piercers_bolt/Initialize()
	. = ..()
	max_range = range //Shouldn't have any falloff past 6 tiles. Penalty is heavy within 6 tiles.

/obj/item/ammo_casing/caseless/rogue/piercers_bolt/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -6,"nx" = 11,"ny" = -6,"wx" = -4,"wy" = -6,"ex" = 2,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/projectile/bullet/reusable/piercers_bolt/on_hit(target)
	. = ..()
	var/mob/living/M = target
	if(ismob(target))
		M.visible_message(span_warning("[M] staggers back from the tremendous impact!"))
		M.apply_status_effect(/datum/status_effect/debuff/staggered, 3 SECONDS)
		M.apply_status_effect(/datum/status_effect/debuff/exposed, 3 SECONDS) 
		M.Slowdown(3 SECONDS)
		M.OffBalance(2 SECONDS) //Heavier Projectile designed for hitting targets with tremendous force; Slow projectile as well, easy to dodge.
		M.Immobilize(2 SECONDS)
		return
