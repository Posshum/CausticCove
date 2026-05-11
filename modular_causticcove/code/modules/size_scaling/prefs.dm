///mob
	//var/step_mechanics_pref = TRUE		// Allow participation in macro-micro step mechanics
	//var/pickup_pref = TRUE				// Allow participation in macro-micro pickup mechanics

/datum/preferences
	//var/pickupable = TRUE

	//var/datum/sizecat/sizecat
	var/sizescale = 100 //This needs to be divided by 100 before applying it!

/*/datum/preferences/proc/_load_pickupable(S)
	S["pickupable"]			>> pickupable

/datum/preferences/proc/save_pickupable(S)
	WRITE_FILE(S["pickupable"], pickupable)*/

/datum/preferences/proc/_load_sizescale(S)
	var/size
	S["sizescale"] >> size
	if(!size)
		size = 100
	sizescale = size

/datum/preferences/proc/save_sizescale(S)
	WRITE_FILE(S["sizescale"], sizescale)

/datum/preferences/proc/select_sizescale(mob/user)
	var/new_target_scale = tgui_input_number(user, "What is your desired size? (Between [RESIZE_MINIMUM * 100] and [RESIZE_MAXIMUM * 100], 100 is default)", "Target Size", sizescale, (RESIZE_MAXIMUM * 100), (RESIZE_MINIMUM * 100), round_value = FALSE)
	if(new_target_scale)
		if(new_target_scale < (RESIZE_MINIMUM * 100) || new_target_scale > (RESIZE_MAXIMUM * 100))
			to_chat(user, "<font color='red'>Value must be between [RESIZE_MINIMUM * 100] and [RESIZE_MAXIMUM * 100].</font>")
			return
		sizescale = new_target_scale
