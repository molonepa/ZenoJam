class_name HealthManager
extends Node

signal health_depleted

var max_health : int = 100
var current_health : int = 100

onready var cooldown = $CooldownTimer

func _process(_delta):
	if current_health == 0:
		emit_signal("health_depleted", owner)

func damage(dmg_amount : int = 0) -> void:
	if cooldown.time_left > 0:
		return

	print("Damaging " + String(dmg_amount))
	current_health = max(0, current_health - dmg_amount)
	cooldown.start()

func heal(heal_amount : int = 0) -> void:
	print("Healing " + String(heal_amount))
	current_health = min(current_health + heal_amount, max_health)
