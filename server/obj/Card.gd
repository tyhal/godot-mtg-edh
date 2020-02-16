extends Node

var tapped = false
var position = {x:0, y:0}

remote func tap():
	tapped = !tapped
