extends TextureRect

@export
var star_stats : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	$Stats.initialize(star_stats)
