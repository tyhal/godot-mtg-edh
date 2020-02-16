extends Node

const PORT = 5001
const MAX_PLAYERS = 5

var server;
var player = load("res://meta/Player.tscn")

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
	var np = player.instance()
	np.name = str(id)
	np.set_id(id)
	$Players.add_child(np)
	$PlayerList.add_item(str(id))

func _client_disconnected(id):
	print("Client " + str(id) + " disconnected from server")
	for i in range($PlayerList.get_item_count()):
		if $PlayerList.get_item_text(i) == str(id):
			$PlayerList.remove_item(i)
	$Players.remove_child($Players.get_node(str(id)))
	
master func try_start_game():
	print("client tried to start game")
	rpc("game_start")
	get_tree().get_root().add_child(load("res://meta/TheFloor.tscn").instance())

