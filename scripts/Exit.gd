extends Area2D

signal player_escaped

func _ready() -> void:
	self.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body) -> void:
	if body.name == "Player":
		emit_signal("player_escaped")
