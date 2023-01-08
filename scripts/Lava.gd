extends Area2D

var damage_amount : int = 3

func _ready() -> void:
	self.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body) -> void:
	if body.name == "Player":
		get_tree().call_group("player_health", "damage", damage_amount)
