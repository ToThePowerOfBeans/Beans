extends Area2D

func _ready():
	pass


func _input(event):
	if event.is_action_pressed("Interact"):
		if overlaps_body($"../Player"):
			next_level()
		else:
			print("No scene in this door")


func next_level():
	var ERR = get_tree().change_scene_to_file("res://Scenes/Levels/Level2.tscn")
	
	if ERR != OK:
		print("error: something broke door scene")
