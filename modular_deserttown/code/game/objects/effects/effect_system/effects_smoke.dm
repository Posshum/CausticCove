/*====================
Zizo Bane sleep powder
====================*/
/datum/effect_system/smoke_spread/zizosleep
	effect_type = /obj/effect/particle_effect/smoke/zizosleep

/obj/effect/particle_effect/smoke/zizosleep/smoke_mob(mob/living/carbon/M)
	if(..())
		M.emote("cough")
		M.apply_status_effect(/datum/status_effect/debuff/knockout)
		return 1

/obj/effect/particle_effect/smoke/zizosleep
	name = "sleep spores"
	icon = 'modular_deserttown/icons/effects/effects.dmi' //CC Edit - Funny Mushrooms
	icon_state = "sleep"
	pixel_x = 0
	pixel_y = 0
	opacity = 0
	layer = FLY_LAYER
	plane = GAME_PLANE_UPPER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	animate_movement = 0
	amount = 4
	lifetime = 8
	density = 0
	opaque = 0 //whether the smoke can block the view when in enough amount
