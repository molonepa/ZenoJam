extends Control

onready var back_button = $MarginContainer/VBoxContainer/VBoxContainer/BackButton

func _ready() -> void:
	back_button.connect("pressed", self, "_on_back")

func _on_back() -> void:
	get_tree().change_scene("res://scenes/MainMenu.tscn")
