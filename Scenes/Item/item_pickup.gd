extends Sprite2D

@export var ID = "0"

func _ready():
	var item_slot_type = ItemLoader.get_slot_type(ID)
	texture = load("res://Textures/"+item_slot_type+"s/" + ItemLoader.get_texture(ID))

func _on_body_entered(_body):
	get_parent().find_child("Inventory").add_item(ID)
	queue_free()
