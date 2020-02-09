extends Node2D

const PORT = 5000
const ADDR = "192.168.2.26"

# Called when the node enters the scene tree for the first time.
func _ready():
	var client = WebSocketClient.new();
	var url = "ws://"+ADDR+":" + str(PORT) 
	var error = client.connect_to_url(url, PoolStringArray(), true);
	get_tree().set_network_peer(client);

