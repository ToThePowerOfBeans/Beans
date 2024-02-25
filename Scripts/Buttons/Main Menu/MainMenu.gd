extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/character_sprite.tscn")


func _on_load_button_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
