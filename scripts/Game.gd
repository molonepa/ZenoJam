extends Node2D

export(int) var lava_speed = 2

onready var lava = $Lava
onready var exit = $Exit

func _ready():
	exit.connect("player_escaped", self, "_on_player_escaped")

func _process(delta) -> void:
	lava.position.y -= delta * lava_speed
	process_inputs()

func process_inputs() -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _on_player_escaped() -> void:
	get_tree().change_scene("res://scenes/Win.tscn")
