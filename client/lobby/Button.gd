extends Button

const PORT = 5001

func _on_Button_button_down():
	var client = WebSocketClient.new();
	var url = "ws://localhost:" + str(PORT) 
	var error = client.connect_to_url(url, PoolStringArray(), true);
	
	if error == 0:
		if client.get_connection_status() == client.CONNECTION_CONNECTED:
			get_tree().change_scene("res://lobby/Lobby.tscn")
		else:
			print("NOT CONNECTED")
	else:
		print(error)
