extends TextureRect

@export var slot_type: int = 0
@export var DAMAGE = 0:
	set(value):
		DAMAGE = value
		if get_parent() is EquipmentSlot:
			get_parent().get_parent().calculate()

@onready var properties: Dictionary = {
	"TEXTURE": texture,
	"DAMAGE": DAMAGE,
	"SLOT_TYPE": slot_type
}:
	set(value):
		properties = value
		texture = properties["TEXTURE"]
		DAMAGE = properties["DAMAGE"]
		slot_type = properties["SLOT_TYPE"]
