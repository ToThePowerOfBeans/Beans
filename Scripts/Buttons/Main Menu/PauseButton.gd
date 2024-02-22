@tool
extends TextureButton

@export
var text = "Text button"
@export
var arrow_margin = 60


# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.scroll_active = false
	set_focus_mode(1)
	setup_text()
	hide_arrow()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		setup_text()
		show_arrow()

func setup_text():
	$RichTextLabel.text = "[center]"+text+"[/center]";

func show_arrow():
	$Arrow.visible = true
	$Arrow.global_position.y = global_position.y + (size.y/1.6)
	var center_x = global_position.x + (size.x/2)
	$Arrow.global_position.x = center_x - arrow_margin

func hide_arrow():
	$Arrow.visible = false


func _on_focus_entered():
	show_arrow()


func _on_focus_exited():
	hide_arrow()


func _on_mouse_entered():
	grab_focus()
