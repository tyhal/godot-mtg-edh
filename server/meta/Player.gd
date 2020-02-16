extends Node

var id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_id(new_id):
	id = new_id
	
func get_id():
	return id
