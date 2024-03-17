extends CharacterBody2D

@export var stats : Resource
@export var speed = 250
var screen_size

var input = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$Name_Plate.text = stats.name
	return
func get_input():
	input.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	input.y = int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))
	return input.normalized()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	input = get_input()
	
	velocity = input * speed
	
	if input == Vector2.ZERO:
		$Sprite.animation = "idle"
	else:
		$Sprite.animation = "run"
		
	if input.x < 0:
		$Sprite.flip_h = true
		$Shadow.position.x = 2
	elif input.x > 0:
		$Sprite.flip_h = false
		$Shadow.position.x = -2
	move_and_slide()
	
