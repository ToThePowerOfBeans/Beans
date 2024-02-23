extends Node2D

func  _ready():
	$VBoxContainer/Resume.grab_focus()

func _on_resume_pressed():
	print("Resume")


func _on_items_pressed():
	print("Items")


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/MainMenu.tscn")
