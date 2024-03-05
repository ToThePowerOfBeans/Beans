extends Node

func _ready():
	$VBoxContainer/Buttons/NewGame.grab_focus()
	#$VBoxContainer/Buttons/NewGame/Arrow.global_position.x = global_position.x + 516



func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/NameSelect/NameSelect.tscn")


func _on_load_game_pressed():
	print("Load")


func _on_quit_pressed():
	get_tree().quit()
