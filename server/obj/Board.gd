extends Node2D

var card = load("res://obj/Card.tscn")
var hand = 7
var colorC = Color(randf(),randf(),randf())
# Called when the node enters the scene tree for the first time.

# ready will do the following:
# Create cards for the current board
func _ready():
	yield(get_tree().create_timer(2.0), "timeout")
	for i in range(hand):
		rpc (create_card(colorC, get_node("Matt").position + Vector2(0,get_node("Matt/CollisionShape2D").shape.get_extents().y)))

remote func create_card(color, pos):
	var pCard = card.instance()
	pCard.set_position(pos)
	pCard.setColor(color)
	pCard.connect("clicked", self, "_on_pickable_clicked")
	get_node("Matt/Cards").add_child(pCard)
