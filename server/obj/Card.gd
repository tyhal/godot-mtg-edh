extends Node

var tapped = false

remote func _tap():
	if tapped  == false:
		tapped = true
	else:
		tapped = false

remote func _get_tap_status():
	return(tapped)
