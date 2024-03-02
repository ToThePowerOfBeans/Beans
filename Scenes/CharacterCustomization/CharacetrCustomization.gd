extends Node2D

func _on_previuos_pressed():
	pass # Replace with function body.

func _on_next_pressed():
	pass


func _on_select_pressed():
	get_tree().change_scene_to_file("res://Scenes/Player.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/NameSelect/NameSelect.tscn")
