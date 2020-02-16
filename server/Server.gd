extends Node

const PORT = 5001
const MAX_PLAYERS = 2

var server;
var cards = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Setup")
	server = WebSocketServer.new();
	server.listen(PORT, PoolStringArray(), true);
	get_tree().set_network_peer(server)
	get_tree().connect("network_peer_connected", self, "_client_connected")
	get_tree().connect("network_peer_disconnected", self, "_client_disconnected")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if server.is_listening():
		server.poll();

func _client_connected(id):
	print('Client ' + str(id) + ' connected to Server')
	var newClient = load("res://obj/Card.tscn").instance()
	newClient.set_position(Vector2(100,100))
	newClient.set_name(str(id))     # spawn players with their respective names
	get_tree().get_root().add_child(newClient)
	# Create a new card on the table	

func _client_disconnected(id):
	print("Client " + id + " disconnected from server")
	# Remove the card from the table
	get_tree().get_root().remove_child(id)
