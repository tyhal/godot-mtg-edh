extends Node2D

var card = load("res://obj/Card.tscn")

var hand = 7
var held_object = null
var colorC = Color(randf(),randf(),randf())
var id = 0
			
# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(2.0), "timeout")
	
	for i in range(hand):
		var pCard = card.instance()
		pCard.set_position(get_node("Matt").position + Vector2(0,get_node("Matt/CollisionShape2D").shape.get_extents().y))
		pCard.setColor(colorC)
		
		#pCard.look_at(Vector2(0,0))
		#inherit parent angle
		
		pCard.connect("clicked", self, "_on_pickable_clicked")
		get_node("Matt/Cards").add_child(pCard)

func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_speed())
			held_object = null
