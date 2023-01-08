extends Control

onready var start_button = $MarginContainer/VBoxContainer/VBoxContainer/StartButton
onready var controls_button = $MarginContainer/VBoxContainer/VBoxContainer/ControlsButton
onready var quit_button = $MarginContainer/VBoxContainer/VBoxContainer/QuitButton

func _ready() -> void:
	start_button.connect("pressed", self, "_on_start")
	controls_button.connect("pressed", self, "_on_controls")
	quit_button.connect("pressed", self, "_on_quit")

func _on_start() -> void:
	get_tree().change_scene("res://scenes/Intro.tscn")

func _on_controls() -> void:
	get_tree().change_scene("res://scenes/ControlsMenu.tscn")

func _on_quit() -> void:
	get_tree().quit()
