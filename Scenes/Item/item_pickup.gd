extends Sprite2D

@export var ID = "0"

func _ready():
	var item_slot_type = ItemLoader.get_slot_type(ID)

	if item_slot_type == 1:
		texture = load("res://Textures/Hat/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 2:
		texture = load("res://Textures/Shirt/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 3:
		texture = load("res://Textures/Pants/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 4:
		texture = load("res://Textures/Shoes/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 5:
		texture = load("res://Textures/Weapons/" + ItemLoader.get_texture(ID))

func _on_body_entered(_body):
	get_parent().find_child("Inventory").add_item(ID)
	queue_free()
