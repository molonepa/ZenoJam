extends Control

var text = ["A  familiar tale... The dwarf whose greed pushed him deeper and got him into trouble.",
		"Never thought you'd find yourself in those shoes, did you?",
		"Oh no... Time to go back up..."]
var current_text : int = 0

onready var label = $Background/MarginContainer/VBoxContainer/Label
onready var next_button = $Background/MarginContainer/VBoxContainer/NextButton
onready var audio = $AudioStreamPlayer

func _ready() -> void:
	next_button.connect("pressed", self, "_on_next")
	label.set_text(text[current_text])

func _on_next() -> void:
	current_text += 1
	if current_text == 2:
		audio.play()
	elif current_text == 3:
		get_tree().change_scene("res://scenes/Game.tscn")
	if current_text < 3:
		label.set_text(text[current_text])
