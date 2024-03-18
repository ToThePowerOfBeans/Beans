extends Area2D

func _ready():
	pass


func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("no scene in this door")
		if get_overlapping_bodies().size() > 0:
			next_level()


func next_level():
	var ERR = get_tree().change_scene_to_file("res://Scenes/Levels/Level2.tscn")
	
	if ERR != OK:
		print("error: something broke door scene")
