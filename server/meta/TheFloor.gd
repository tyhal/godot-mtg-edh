extends Node2D

var board = load("res://obj/Board.tscn")
var center = Vector2(0,0)
var ingameplayers = 0;

master func create_board(pos, id):
	print("maka da board")
	var pBoard = board.instance()
	pBoard.set_position(pos)
	pBoard.look_at(center)
	pBoard.id = id
	pBoard.name = str(id)
	get_node("Boards").add_child(pBoard)
	
master func player_loaded():
	print("a player has loaded in")
	var tot_players = get_tree().get_root().get_node("Lobby/Players").get_child_count()
	ingameplayers += 1
	if tot_players == ingameplayers:
		all_loaded()

func all_loaded():
	
	var players = get_tree().get_root().get_node("Lobby/Players")
	var radius = 200.0 * ingameplayers

	# Get how much of an angle objects will be spaced around the circle.
	# Angles are in radians so 2.0*PI = 360 degrees
	var angle_step = 2.0*PI / ingameplayers
	
	var angle = 0.5*PI 
	
	# For each node to spawn
	for i in range(0, ingameplayers):
	
		var direction = Vector2(cos(angle), sin(angle))
		var pos = center + direction * radius
		
		var id = players.get_child(i).get_id()
		rpc("create_board", pos , id )
		rpc("create_board_p", pos , id )
		rpc_id(id,"set_player_board", id)
	
		# Rotate one step
		angle += angle_step
