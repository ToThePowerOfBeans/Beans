extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.visible = false;


func _on_body_entered(_body):
	$Panel.visible = true;


func _on_area_2d_body_exited(body):
	$Panel.visible = false;
