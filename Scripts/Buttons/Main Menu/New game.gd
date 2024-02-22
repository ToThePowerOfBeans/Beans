extends Button

var NewGameScene
# Called when the node enters the scene tree for the first time.
func _ready():
	NewGameScene = preload("res://Scenes/character_sprite.tscn").instantiate()


func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/character_sprite.tscn")
