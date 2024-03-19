extends VBoxContainer

@onready
var stats = $Stats
@export
var start_stats : Resource
@export
var skills : Array
signal levelUp
signal dead
# Called when the node enters the scene tree for the first time.
func _ready():
	stats.initialize(start_stats)
	$CharacterName.text = stats.charName
	$HP.text = "HP:%s/%s" % [stats.health, stats.max_health]
	$SP.text = "SP:%s/%s" % [stats.skills, stats.max_skills]

func _on_stats_health_changed(new_health):
	$HP.text = "HP:%s/%s" % [stats.health, stats.max_health]


func _on_stats_level_up():
	emit_signal("levelUp")


func _on_stats_healt_gone():
	emit_signal("dead")


func _on_stats_sp_change(newSp):
	$SP.text="SP:%s/%s" % [stats.skills, stats.max_skills]
