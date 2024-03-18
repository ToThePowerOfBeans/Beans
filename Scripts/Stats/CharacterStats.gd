extends Node

var charName : String
var health : int
var skills : int
var max_health : int
var max_skills : int
var attack : int
var defense : int
var speed : int
var level : int
var exp : int
var levelExp : int

signal health_changed(new_health)
signal spChange(newSp)
signal healt_gone
signal defending
signal LevelUp

func initialize(stats : Stats):
	charName = stats.name
	max_health = stats.vitality * 2
	max_skills = stats.inteligence * 2
	attack = stats.strenght * 2
	defense = stats.vitality + stats.strenght
	speed = stats.agility * 2
	health = max_health
	skills = max_skills
	level = stats.level
	exp = stats.exp
	levelExp = stats.levelUpExp

func set_max_health(value):
	max_health = max(0, value)

func set_max_skills(value):
	max_skills = max(0,value)

func hit(damage):
	health -= damage
	health = max(0,health)
	emit_signal("health_changed", health)
	if(health == 0):
		emit_signal("healt_gone")

func useSP(cost):
	skills -= cost
	skills = max(0,skills)
	print("change")
	emit_signal("spChange", skills)

func heal(amount):
	health += amount
	health = max(health,max_health)
	emit_signal("health_changed",health)

func defend():
	defense = defense*2
	emit_signal("defending")

func expGain(Exp):
	exp += Exp
	if(exp >= levelExp):
		levelUp()

func levelUp():
	level+=1
	exp -= levelExp
	emit_signal("LevelUp")
