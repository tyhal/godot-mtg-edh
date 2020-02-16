extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var self_data = {name = ''}

func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('network_peer_connected', self, '_on_player_connected')

func connect_to_server(player_nickname):
	self_data.name = player_nickname
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
