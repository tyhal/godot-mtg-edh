extends Control

remote func game_start():
	print("server yeeted us into a game")
	get_tree().change_scene("res://meta/TheFloor.tscn")

func _on_Start_button_down():
	rpc("try_start_game")
	print("try_start_game")
