extends TextureRect

@export
var star_stats : Resource

signal dead

# Called when the node enters the scene tree for the first time.
func _ready():
	$Stats.initialize(star_stats)


func _on_stats_healt_gone():
	emit_signal("dead")
