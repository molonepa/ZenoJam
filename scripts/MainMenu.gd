extends Control

onready var start_button = $MarginContainer/VBoxContainer/VBoxContainer/StartButton
onready var options_button = $MarginContainer/VBoxContainer/VBoxContainer/OptionsButton
onready var credits_button = $MarginContainer/VBoxContainer/VBoxContainer/CreditsButton
onready var quit_button = $MarginContainer/VBoxContainer/VBoxContainer/QuitButton

func _ready() -> void:
	start_button.connect("pressed", self, "_on_start")
	options_button.connect("pressed", self, "_on_options")
	credits_button.connect("pressed", self, "_on_credits")
	quit_button.connect("pressed", self, "_on_quit")

func _on_start() -> void:
	get_tree().change_scene("res://scenes/Game.tscn")

func _on_options() -> void:
	print('Options pressed')

func _on_credits() -> void:
	print('Credits pressed')

func _on_quit() -> void:
	get_tree().quit()
