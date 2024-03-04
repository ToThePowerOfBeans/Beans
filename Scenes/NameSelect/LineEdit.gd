extends LineEdit

func _ready():
	grab_focus();
	set_caret_column(len(placeholder_text));
