extends Node2D
@onready
var player =load("res://Textures/Characters/PlayerCharacter/MC.tres")

func _on_continiue_pressed():
	player.name = $LineEdit.text
	ResourceSaver.save(player,"res://Textures/Characters/PlayerCharacter/MC.tres")
	get_tree().change_scene_to_file("res://Scenes/CharacterCustomization/customization.tscn")

func _on_line_edit_text_submitted(new_text): 
	
	_on_continiue_pressed()


func _on_go_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/MainMenu.tscn")



