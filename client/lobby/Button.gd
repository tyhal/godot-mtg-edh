extends Button

const PORT = 5001
var client = WebSocketClient.new()

func _on_Button_button_down():
	get_tree().connect("network_peer_connected", self, "_connected")
	var url = "ws://127.0.0.1:" + str(PORT) 
	var error = client.connect_to_url(url, PoolStringArray(), true);
	get_tree().set_network_peer(client);
	print(error)

func _connected(id):
	var stat = client.get_connection_status()
	if stat == client.CONNECTION_CONNECTED:
		print("CONNECTION_CONNECTED")
		get_tree().change_scene("res://lobby/Lobby.tscn")
	if stat == client.CONNECTION_CONNECTING:
		print("CONNECTION_CONNECTING")
	if stat == client.CONNECTION_DISCONNECTED:
		print("CONNECTION_DISCONNECTED")

