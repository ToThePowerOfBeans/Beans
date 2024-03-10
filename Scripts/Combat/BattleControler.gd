extends Control

signal textbox_closed

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextBox.hide()
	$ActionPanel.hide()
	displayText("A new %s aproaches" % $HBoxContainer/Enemy/Stats.charName)
	await self.textbox_closed
	$ActionPanel.show()
	$ActionPanel/Actions/Margins/Attack.grab_focus()

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
		get_tree().change_scene_to_file("res://Scenes/Player.tscn")
	else:
		displayText("You failed to run away")
		await self.textbox_closed
		$ActionPanel.show()


func _on_defend_pressed():
	$PlayerPanel/CharacterZone/Player1.stats.defend()


func _on_attack_pressed():
	if($HBoxContainer/Enemy/Stats.speed > $PlayerPanel/CharacterZone/Player1/Stats.speed):
		EnemyAttack()
		await self.textbox_closed
		PlayerAttack()
		await self.textbox_closed
	else:
		PlayerAttack()
		await self.textbox_closed
		EnemyAttack()
		await self.textbox_closed
	if($HBoxContainer/Enemy/Stats.health <= 0):
		displayText("%s has been defeated" % $HBoxContainer/Enemy/Stats.charName)
		await self.textbox_closed
		get_tree().change_scene_to_file("res://Scenes/Player.tscn")
	$ActionPanel.show()
	$ActionPanel/Actions/Margins/Attack.grab_focus()

func PlayerAttack():
	displayText("Enemy was hit for %s damage" % $PlayerPanel/CharacterZone/Player1/Stats.attack)
	$HBoxContainer/Enemy/Stats.hit($PlayerPanel/CharacterZone/Player1/Stats.attack)

func EnemyAttack():
	displayText("You have been hit for %s damage" % $HBoxContainer/Enemy/Stats.attack)
	$PlayerPanel/CharacterZone/Player1/Stats.hit($HBoxContainer/Enemy/Stats.attack)
