extends Sprite2D
@export var d : int = 4
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = rng.randf_range(-60, +60)
	if d > 0:
		var kx = 1
		if (d%2 == 0):
			kx = 2
		for i in kx:
			var next_segment = load("res://Scenes/Menu/Lightning.tscn").instantiate()
			next_segment.position = $Marker2D.position
			next_segment.scale = next_segment.scale * 0.8
			next_segment.d = d - 1
			self.add_child(next_segment)
	
var t = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	if t >= 0.3:
		$".".queue_free()
