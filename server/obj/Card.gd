extends Node

var tapped = false

remote func tap(id):
	if tapped  == false:
		tapped = true
	else:
		tapped = false

remote func get_tap_status():
	return(tapped)
