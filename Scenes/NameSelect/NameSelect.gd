extends Node2D

func _on_continiue_pressed():
	get_tree().change_scene_to_file("res://Scenes/CharacterCustomization/customization.tscn")

func _on_line_edit_text_submitted(new_text): 
	
	_on_continiue_pressed()


func _on_go_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/MainMenu.tscn")



