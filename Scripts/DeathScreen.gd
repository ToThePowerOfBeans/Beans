extends Node2D


func _on_play_againutton_pressed():
	get_tree().change_scene_to_file("res://DeathScreen.tscn")

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/MainMenu.tscn")
