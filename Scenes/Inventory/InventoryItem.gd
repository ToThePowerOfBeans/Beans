extends TextureRect

@export var ID = "0"

var properties 
func set_properties(data):
	properties = data
	$TextureRect.texture = data["TEXTURE"]



func _on_gui_input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(properties["SLOT_TYPE"] == "HEAD"):
			$"../../../GridContainer/Head".set_properties(properties)
		elif(properties["SLOT_TYPE"] == "BODY"):
			$"../../../GridContainer/Body".set_properties(properties)
		elif(properties["SLOT_TYPE"] == "LEGS"):
			$"../../../GridContainer/Legs".set_properties(properties)
		elif(properties["SLOT_TYPE"] == "WEAPON"):
			$"../../../GridContainer/Weapon".set_properties(properties)

