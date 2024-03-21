extends Node

var items : Dictionary

func _ready():
	var file = FileAccess.open("res://Scripts/Items/database.json",FileAccess.READ)
	
	items = JSON.parse_string(file.get_as_text())
	
	file.close()

func get_texture(ID = "0"):
	return items[str(ID)]["texture"]
	
func get_ATK(ID = "0"):
	return items[str(ID)]["DAMAGE"]
	
func get_slot_type(ID = "0"):
	return items[str(ID)]["slot_type"]
