extends CharacterBody2D

@export var speed = 250
@export var rot_speed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2(0,1) * speed
	rotation_degrees += rot_speed
	move_and_slide()


func _on_visibility_notifier_screen_exited():
	$".".queue_free()
