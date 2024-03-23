extends Control
var is_open

func _ready():
	for child in $ScrollContainer/VBoxContainer.get_children():
		child.queue_free()
	is_open = false
	$".".visible = is_open

func _process(_delta):
	if Input.is_action_just_pressed("Inventory"):
		is_open = !is_open
		
		$".".visible = is_open
		$"../..".disabled = is_open

func add_item(ID):
	var item_slot_type = ItemLoader.get_slot_type(ID)
	var texture
	
	texture = load("res://Textures/"+item_slot_type+"s/" + ItemLoader.get_texture(ID))
	var owned = false
	
	for child in $ScrollContainer/VBoxContainer.get_children():
		if child.ID == ID:
			owned = true
	
	if owned == false:	
		var item_ATK = ItemLoader.get_ATK(ID)
		
		var item_data = {
			"TEXTURE": texture,
			"DAMAGE": item_ATK,
			"SLOT_TYPE": item_slot_type
		}
		var new_item = load("res://Scenes/Inventory/InventoryItem.tscn").instantiate()
		new_item.set_properties(item_data)
		new_item.ID = ID
		$ScrollContainer/VBoxContainer.add_child(new_item)
