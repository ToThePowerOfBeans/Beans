extends TextureRect

var properties 
func set_properties(data):
	properties = data
	$TextureRect.texture = data["TEXTURE"]
