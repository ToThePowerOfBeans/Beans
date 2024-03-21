extends Control
var is_open

func _ready():
	is_open = false
	$".".visible = is_open

func _process(_delta):
	if Input.is_action_just_pressed("Inventory"):
		is_open = !is_open
		
		$".".visible = is_open
		$"../..".disabled = is_open

func add_item(ID):
	var item_slot_type = ItemLoader.get_slot_type(ID)
	var item_texture
	
	if item_slot_type == 1:
		item_texture = load("res://Textures/Hat/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 2:
		item_texture = load("res://Textures/Shirt/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 3:
		item_texture = load("res://Textures/Pants/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 4:
		item_texture = load("res://Textures/Shoes/" + ItemLoader.get_texture(ID))
	elif item_slot_type == 5:
		item_texture = load("res://Textures/Weapons/" + ItemLoader.get_texture(ID))
	
	var item_ATK = ItemLoader.get_ATK(ID)
	
	var item_data = {
		"TEXTURE": item_texture,
		"DAMAGE": item_ATK,
		"SLOT_TYPE": item_slot_type
	}
	var new_item = load("res://Scenes/Inventory/InventoryItem.tscn").instantiate()
	new_item.set_properties(item_data)
	$ScrollContainer/VBoxContainer.add_child(new_item)
