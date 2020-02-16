extends Node2D

var board = load("res://obj/Board.tscn")
var center = Vector2(0,0)

func _ready():
	print("LOADED INTO THE GAME")
	rpc("player_loaded")

remote func set_player_board(id):
	print("we are player " + str(id))
	$Boards.get_node(str(id)).get_node("Camera2D").current = true

remote func create_board(pos, id):
	print("Make the board for Client {}".format(id))
	var pBoard = board.instance()
	pBoard.set_position(pos)
	pBoard.look_at(center)
	pBoard.id = str(id)
	pBoard.name = str(id)
	get_node("Boards").add_child(pBoard)
