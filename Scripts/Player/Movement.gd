extends Area2D

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("Right"):
		velocity.x += 1
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
	if Input.is_action_pressed("Down"):
		velocity.y += 1
	if Input.is_action_pressed("Up"):
		velocity.y -= 1

	velocity = velocity.normalized() * speed
	
	if velocity == Vector2.ZERO:
		$Sprite.animation = "idle"
	elif velocity.x > 0: 
		$Sprite.animation = "walk_right"
	elif velocity.x < 0: 
		$Sprite.animation = "walk_left"
	elif velocity.y > 0: 
		$Sprite.animation = "walk_down"
	elif velocity.y < 0: 
		$Sprite.animation = "walk_up"
	

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
