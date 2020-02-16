extends Node2D

var board = load("res://obj/Board.tscn")
var center = Vector2(0,0)

remote func set_player_board(id):
	print("we are player " + str(id))
	$Boards.get_node(str(id)).get_node("Camera2D").current = true

remote func create_board_p(pos, id):
	print("maka da board")
	var pBoard = board.instance()
	pBoard.set_position(pos)
	pBoard.look_at(center)
	pBoard.id = id
	pBoard.name = str(id)
	get_node("Boards").add_child(pBoard)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("LOADED INTO THE GAME")
	rpc("player_loaded")
	pass # Replace with function body.

