extends Node2D

var card = load("res://obj/Card.tscn")

var held_object = null
var id = 0

func _on_pickable_clicked(object):
	if !held_object:
		held_object = object 
		held_object.pickup()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_speed())
			held_object = null
