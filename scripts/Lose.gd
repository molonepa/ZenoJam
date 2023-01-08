extends Control

onready var label = $Background/MarginContainer/VBoxContainer/Label
onready var restart_button = $Background/MarginContainer/VBoxContainer/HBoxContainer/RestartButton
onready var quit_button = $Background/MarginContainer/VBoxContainer/HBoxContainer/QuitButton

func _ready() -> void:
	quit_button.connect("pressed", self, "_on_quit")
	restart_button.connect("pressed", self, "_on_restart")

func _on_quit() -> void:
	get_tree().quit()

func _on_restart() -> void:
	get_tree().change_scene("res://scenes/Game.tscn")
