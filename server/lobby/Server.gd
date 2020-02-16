extends Node

const PORT = 5001
const MAX_PLAYERS = 5

var server;
var cards = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Setup")
	server = WebSocketServer.new();
	server.listen(PORT, PoolStringArray(), true);
	get_tree().set_network_peer(server)
	print(get_tree().connect("network_peer_connected", self, "_client_connected"))
	print(get_tree().connect("network_peer_disconnected", self, "_client_disconnected"))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if server.is_listening():
		server.poll();

func _client_connected(id):
	print('Client ' + str(id) + ' connected to Server')
	var newClient = load("res://meta/Client.tscn").instance()
	newClient.set_name(str(id))     # spawn players with their respective names
	get_tree().get_root().add_child(newClient)
<<<<<<< HEAD:server/Server.gd
	# Create a new card on the table	

func _client_disconnected(id):
	print("Client " + id + " disconnected from server")
	# Remove the card from the table
	get_tree().get_root().remove_child(id)
=======
	rpc("hello")

func _client_disconnected(id):
	print("Client " + str(id) + " disconnected from server")
	var r = get_tree().get_root()
	r.remove_child(r.get_node(str(id)))
>>>>>>> 7dc47f5138c382895e431c5f27c97323186ed7a7:server/lobby/Server.gd
