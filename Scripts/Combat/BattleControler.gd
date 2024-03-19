extends Control

signal textbox_closed

@onready
var player = $PlayerPanel/CharacterZone/Player1/Stats
@onready var play = $PlayerPanel/CharacterZone/Player1

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextBox.hide()
	$ActionPanel.hide()
	$AttackPanel.hide()
	displayText("A new %s aproaches" % $HBoxContainer/Enemy/Stats.charName)
	await self.textbox_closed
	$ActionPanel.show()

func displayText(text):
	$ActionPanel.hide()
	$TextBox.show()
	$TextBox/TextBox/MarginContainer/Text.text = text

func _input(event):
	if((Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $TextBox.visible):
		$TextBox.hide()
		emit_signal("textbox_closed")




func _on_run_pressed():

	if(randi()%10 >= 3):
		displayText("You ran away well")
		await self.textbox_closed
		get_tree().change_scene_to_file("res://Scenes/test_room.tscn")
	else:
		displayText("You failed to run away")
		await self.textbox_closed
		$ActionPanel.show()


func _on_defend_pressed():
	$PlayerPanel/CharacterZone/Player1.stats.defend()


func _on_attack_pressed():
	$ActionPanel.hide()
	$AttackPanel.show()

func PlayerAttack():
	displayText("Enemy was hit for %s damage" % player.attack)
	$HBoxContainer/Enemy/Stats.hit(player.attack)

func PlayerSkill():
	displayText("You hit the enemy with %s for %s damage" % [play.skills[0].name, play.skills[0].damage])
	player.useSP(play.skills[0].spCost)
	$HBoxContainer/Enemy/Stats.hit(play.skills[0].damage)

func EnemyAttack():
	displayText("You have been hit for %s damage" % $HBoxContainer/Enemy/Stats.attack)
	player.hit($HBoxContainer/Enemy/Stats.attack)

func _on_player_1_level_up():
	displayText("You have gained a level")


func _on_weapon_pressed():
	if($HBoxContainer/Enemy/Stats.speed > player.speed):
		EnemyAttack()
		await self.textbox_closed
		PlayerAttack()
	else:
		PlayerAttack()
		await self.textbox_closed
		EnemyAttack()
	await self.textbox_closed
	$AttackPanel.hide()
	$ActionPanel.show()
func _on_skils_pressed():
	if($HBoxContainer/Enemy/Stats.speed > player.speed):
		EnemyAttack()
		await self.textbox_closed
		PlayerSkill()
	else:
		PlayerSkill()
		await self.textbox_closed
		EnemyAttack()
	await self.textbox_closed
	$AttackPanel.hide()
	$ActionPanel.show()

func _on_enemy_dead():
	displayText("%s has been defeated" % $HBoxContainer/Enemy/Stats.charName)
	await self.textbox_closed
	displayText("You have gained 20 exp")
	await self.textbox_closed
	player.expGain(20)
	await self.textbox_closed
	get_tree().change_scene_to_file("res://Scenes/test_room.tscn")

func _on_player_1_dead():
	displayText("You have been defeated")
	await self.textbox_closed
	get_tree().change_scene_to_file("res://Scenes/DeathScreen.tscn")
