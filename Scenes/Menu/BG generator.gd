extends Node2D

@onready var Bean = preload("res://Scenes/Menu/Bean.tscn")
@onready var Lightning = preload("res://Scenes/Menu/Lightning.tscn")
var rng = RandomNumberGenerator.new()

var t = 0


func _process(delta):
	t += delta
	if t >= 0.1 && get_child_count() < 100:
		var GrabedInstance = Bean.instantiate()
		GrabedInstance.position.x = rng.randf_range(0, 1162)
		GrabedInstance.position.y = -64
		GrabedInstance.scale = GrabedInstance.scale * rng.randf_range(1, 3)
		GrabedInstance.speed = 100 * GrabedInstance.scale.x
		GrabedInstance.rot_speed = rng.randf_range(-0.05,0.05)
		self.add_child(GrabedInstance)
		
		#Lnode.queue_free()
		var Lnode = Lightning.instantiate()
		Lnode.scale = Lnode.scale * 4
		Lnode.z_index = -1
		Lnode.position.x = rng.randf_range(0, 1162)
		self.add_child(Lnode)
		
		Bean.instantiate()
		t = 0
