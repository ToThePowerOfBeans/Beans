extends GridContainer

func _ready():
	pass
	
func add_item(ID = "0"):
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
	
	var emptyIndex = 0
	for slot in get_children():
		if slot.filled == false:
			emptyIndex = slot.get_index()
			break
	get_child(emptyIndex).set_properties(item_data)
	
