extends Node2D

var board = load("res://obj/Board.tscn")
var center = Vector2(0,0)

func create_board(pos, id):
	var pBoard = board.instance()
	pBoard.set_position(pos)
	pBoard.look_at(center)
	pBoard.set_player(id)
	pBoard.name = str(id)
	get_node("Boards").add_child(pBoard)
	print("Maka da board")
	rpc("new_player_board")
	rpc_id(id,"set_player_board", id)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var players = get_tree().get_root().get_node("Lobby/Players")
	
	var pc = players.get_child_count()
	
	var radius = 200.0 * pc

	# Get how much of an angle objects will be spaced around the circle.
	# Angles are in radians so 2.0*PI = 360 degrees
	var angle_step = 2.0*PI / pc
	
	var angle = 0.5*PI 
	
	# For each node to spawn
	for i in range(0, pc):
	
		var direction = Vector2(cos(angle), sin(angle))
		var pos = center + direction * radius
		
		create_board(pos,players.get_child(i).get_id())
	
		# Rotate one step
		angle += angle_step
