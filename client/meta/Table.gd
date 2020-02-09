extends Node2D

var board = load("res://meta/Board.tscn")

const playercount = 4

# Called when the node enters the scene tree for the first time.
func _ready():

	var radius = 200.0 * playercount
	var center = Vector2(0,0)
	
	# Get how much of an angle objects will be spaced around the circle.
	# Angles are in radians so 2.0*PI = 360 degrees
	var angle_step = 2.0*PI / playercount
	
	var angle = 0.5*PI 
	
	# For each node to spawn
	for i in range(0, playercount):
	
		var direction = Vector2(cos(angle), sin(angle))
		var pos = center + direction * radius
	
		var pBoard = board.instance()
		pBoard.set_position(pos)
		pBoard.look_at(Vector2(0,0))
		get_node("Boards").add_child(pBoard)
	
		# Rotate one step
		angle += angle_step
