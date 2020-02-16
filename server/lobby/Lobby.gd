extends Node

const PORT = 5001
const MAX_PLAYERS = 5

var server;
<<<<<<< HEAD:server/lobby/Server.gd
=======

>>>>>>> f977c19c6cd3c98a3145c0c28c1c8f3a4c455d15:server/lobby/Lobby.gd
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Setup")
	server = WebSocketServer.new();
	server.listen(PORT, PoolStringArray(), true);
	get_tree().set_network_peer(server)
	print(get_tree().connect("network_peer_connected", self, "_client_connected"))
	print(get_tree().connect("network_peer_disconnected", self, "_client_disconnected"))
	var newCard = load("res://obj/Card.tscn").instance()
	get_node("Cards").add_child(newCard)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if server.is_listening():
		server.poll();

func _client_connected(id):
	print('Client ' + str(id) + ' connected to Server')
	var newClient = load("res://meta/Player.tscn").instance()
	newClient.set_name(str(id))     # spawn players with their respective names
<<<<<<< HEAD:server/lobby/Server.gd
	get_tree().get_root().add_child(newClient)
	rpc("hello")
=======
	get_node("Players").add_child(newClient) 
	$PlayerList.add_item(str(id))
>>>>>>> f977c19c6cd3c98a3145c0c28c1c8f3a4c455d15:server/lobby/Lobby.gd

func _client_disconnected(id):
	print("Client " + str(id) + " disconnected from server")
	var r = get_node("Players")
	r.remove_child(r.get_node(str(id)))
<<<<<<< HEAD:server/lobby/Server.gd
=======
	for i in range($PlayerList.get_item_count()):
		if $PlayerList.get_item_text(i) == str(id):
			$PlayerList.remove_item(i)
>>>>>>> f977c19c6cd3c98a3145c0c28c1c8f3a4c455d15:server/lobby/Lobby.gd
