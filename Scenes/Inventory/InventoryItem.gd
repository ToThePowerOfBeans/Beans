extends TextureRect

func set_properties(data):
	var properties = data
	$TextureRect.texture = data["TEXTURE"]
