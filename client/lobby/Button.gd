extends Button

const PORT = 5000

func _on_Button_button_down():
	var client = WebSocketClient.new();
	var url = "ws://127.0.0.1:" + str(PORT) # You use "ws://" at the beginning of the address for WebSocket connections
	var error = client.connect_to_url(url, PoolStringArray(), true);
	if error == 0:
		print(error)
		print(client.get_connection_status())
		#get_tree().change_scene("res://meta/Table.tscn")
	else:
		print(error)
