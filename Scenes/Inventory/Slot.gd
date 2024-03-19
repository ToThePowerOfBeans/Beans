extends PanelContainer
class_name Slot

@onready var texture_rect = $TextureRect

@export_enum("ANY:0","HAT:1","SHIRT:2","PANTS:3","SHOES:4","WEAPON:5") var slot_type : int

var filled : bool = false

func _get_drag_data(at_position):
	#set_drag_preview(get_preview())
	return texture_rect

func _can_drop_data(_pos,data):
	return data is TextureRect
	
func _drop_data(_pos,data):
	var temp = texture_rect.properties
	texture_rect.properties = data.properties
	data.properties = temp

#func get_preview():
	#var preview_texture = TextureRect.new()
	#
	#preview_texture.texture = texture_rect.texture
	#preview_texture.expand_mode = 1
	#preview_texture.size = Vector2(30,30)
	#
	#var preview = Control.new()
	#preview.add_child(preview_texture)
	#return preview

func get_ATK():
	return texture_rect.DAMAGE

func set_properties(data):
	texture_rect.properties = data
	
	if data["TEXTURE"] == null:
		filled = false
	else:
		filled = true
