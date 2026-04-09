/datum/charflaw/mangled_jaw
	name = "Mangled Jaw"
	desc = " Your jaw has been irreversibly damage.\
	\nWhether from defect at birth, a long lasting injury, or simply a horrible tooth-ache, it pains you to eat, drink, or bite just about anything.\
	If you are experiencing too much pain, from anything, you will not be able to eat or drink willingly, and it'll hurt like hell when someone force feeds you beyond your limits. "

/datum/charflaw/mangled_jaw/on_mob_creation(mob/user)
	ADD_TRAIT(user, TRAIT_MANGLED_JAW, TRAIT_GENERIC)

//TO ADD - Make speaking a pain. Screaming/Yelling should be even more painful. 
// Possibly make oral cause issues as well when attempting to perform or being made to take oral.
// Spellcasting could have a chance to fail on a scale of how much pain you're possibly in with this vice if it's an incantation you speak.
