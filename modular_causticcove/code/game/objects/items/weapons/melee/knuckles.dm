/datum/intent/knuckles/strike
	name = "punch"
	blade_class = BCLASS_BLUNT
	attack_verb = list("punches", "clocks")
	hitsound = list('sound/combat/hits/punch/punch_hard (1).ogg', 'sound/combat/hits/punch/punch_hard (2).ogg', 'sound/combat/hits/punch/punch_hard (3).ogg')
	chargetime = 0
	penfactor = PEN_NONE
	clickcd = 8
	swingdelay = 0
	icon_state = "inpunch"
	item_d_type = "blunt"
	intent_intdamage_factor = BLUNT_DEFAULT_INT_DAMAGEFACTOR // This might be a mistake

/datum/intent/knuckles/strike/wallop
	name = "wallop"
	blade_class = BCLASS_TWIST
	attack_verb = list("wallops", "thwacks", "thwamps")
	damfactor = 1.1
	intent_intdamage_factor = 0.6
	icon_state = "inbash"	// Wallop is too long for a button; placeholder.

/obj/item/rogueweapon/knuckles
	name = "steel knuckles"
	desc = "A mean looking pair of steel knuckles."
	force = 25
	possible_item_intents = list(/datum/intent/knuckles/strike,/datum/intent/mace/smash, /datum/intent/knuckles/strike/wallop)
	icon = 'icons/roguetown/weapons/unarmed32.dmi'
	icon_state = "steelknuckle"
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_HIP
	parrysound = list('sound/combat/parry/pugilism/unarmparry (1).ogg','sound/combat/parry/pugilism/unarmparry (2).ogg','sound/combat/parry/pugilism/unarmparry (3).ogg')
	sharpness = IS_BLUNT
	max_integrity = ARMOR_INT_SIDE_LEATHER
	swingsound = list('sound/combat/wooshes/punch/punchwoosh (1).ogg','sound/combat/wooshes/punch/punchwoosh (2).ogg','sound/combat/wooshes/punch/punchwoosh (3).ogg')
	associated_skill = /datum/skill/combat/unarmed
	throwforce = 12
	wdefense = 4
	wbalance = WBALANCE_SWIFT
	anvilrepair = /datum/skill/craft/weaponsmithing
	grid_width = 64
	grid_height = 32
	special = /datum/special_intent/upper_cut

/obj/item/rogueweapon/knuckles/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.2,"sx" = -7,"sy" = -4,"nx" = 7,"ny" = -4,"wx" = -3,"wy" = -4,"ex" = 1,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 110,"sturn" = -110,"wturn" = -110,"eturn" = 110,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.1,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/knuckles/bronzeknuckles
	name = "bronze knuckles"
	desc = "A mean looking pair of bronze knuckles. Mildly heavier than it's steel counterpart, making it a solid defensive option, if less wieldy."
	force = 22
	possible_item_intents = list(/datum/intent/knuckles/strike, /datum/intent/mace/smash, /datum/intent/knuckles/strike/wallop)
	icon = 'icons/roguetown/weapons/unarmed32.dmi'
	icon_state = "bronzeknuckle"
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_HIP
	parrysound = list('sound/combat/parry/pugilism/unarmparry (1).ogg','sound/combat/parry/pugilism/unarmparry (2).ogg','sound/combat/parry/pugilism/unarmparry (3).ogg')
	sharpness = IS_BLUNT
	swingsound = list('sound/combat/wooshes/punch/punchwoosh (1).ogg','sound/combat/wooshes/punch/punchwoosh (2).ogg','sound/combat/wooshes/punch/punchwoosh (3).ogg')
	associated_skill = /datum/skill/combat/unarmed
	throwforce = 12
	wdefense = 6
	anvilrepair = /datum/skill/craft/weaponsmithing

/obj/item/rogueweapon/knuckles/aknuckles
	name = "decrepit knuckles"
	desc = "a set of knuckles made of ancient metals, Aeon's grasp wither their form."
	icon_state = "aknuckle"
	force = 12
	max_integrity = 50
	wdefense = 4
	blade_dulling = DULLING_SHAFT_CONJURED

/obj/item/rogueweapon/knuckles/paknuckles
	name = "ancient knuckles"
	desc = "a set of knuckles made of ancient metals, Aeon's grasp has been lifted from their form."
	icon_state = "aknuckle"

/*/obj/item/rogueweapon/knuckles/silver
	name = "silver knuckles"
	desc = "A simple piece of harm that has been molded from pure silver, and further studded to stop errant strikes dead in their tracks. Though ostensibly holy, these heftsome knuckleweights are \
	more strongly associated with underground pugilistic tournaments; a solid right hook could drive more-than-enough force to blow a yeoman's jaw clean off."
	icon_state = "silverknuckle"
	force = 27 //Smaller silver blunt weapons should have a +2-3 damage bonus, compared to their steel counterparts.
	wdefense = 5
	is_silver = TRUE

/obj/item/rogueweapon/knuckles/silver/ComponentInitialize()
	AddComponent(\
		/datum/component/silverbless,\
		pre_blessed = BLESSING_NONE,\
		silver_type = SILVER_TENNITE,\
		added_force = 0,\
		added_blade_int = 0,\
		added_int = 50,\
		added_def = 2,\
	)*/

/obj/item/rogueweapon/knuckles/psydon
	name = "psydonic knuckles"
	desc = "A simple piece of harm molded in a holy mixture of steel and silver, finished with three stumps - Psydon's crown - to crush the heretics' garments and armor into smithereens."
	icon_state = "psyknuckle"
	force = 27 //Smaller silver blunt weapons should have a +2-3 damage bonus, compared to their steel counterparts.
	wdefense = 5
	is_silver = TRUE

/obj/item/rogueweapon/knuckles/psydon/ComponentInitialize()
	AddComponent(\
		/datum/component/silverbless,\
		pre_blessed = BLESSING_NONE,\
		silver_type = SILVER_PSYDONIAN,\
		added_force = 0,\
		added_blade_int = 0,\
		added_int = 50,\
		added_def = 2,\
	)

/obj/item/rogueweapon/knuckles/psydon/old
	name = "enduring knuckles"
	desc = "A simple piece of harm molded in a holy mixture of steel and silver, its holy blessing long since faded. You are HIS weapon, you needn't fear Aeon."
	icon_state = "psyknuckle"
	force = 22
	wdefense = 6
	is_silver = FALSE
	color = COLOR_FLOORTILE_GRAY

/obj/item/rogueweapon/knuckles/psydon/old/ComponentInitialize()
	return

/obj/item/rogueweapon/knuckles/eora
	name = "close caress"
	desc = "Some times call for a more intimate approach."
	icon_state = "eoraknuckle"
	max_integrity = 150
	force = 28 // lower this to 27 if its too much
