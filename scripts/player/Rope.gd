class_name Rope
extends Area2D

onready var line = $Line2D
onready var sprite = $Sprite
onready var collision = $CollisionShape2D

func _ready() -> void:
	self.connect("body_entered", self, "_on_body_entered")
	self.connect("body_exited", self, "_on_body_exited")

func get_class():
	return "Rope"

func initialise(start: Vector2, end: Vector2) -> void:
	sprite.position = start

	self.line.add_point(start)
	self.line.add_point(end)

	var shape = SegmentShape2D.new()
	shape.a = start
	shape.b = end

	collision.shape = shape

func _on_body_entered(body) -> void:
	if body.name == 'Player':
		get_tree().call_group("player_interaction", "update_interaction_object", self)

func _on_body_exited(body) -> void:
	if body.name == 'Player':
		get_tree().call_group("player_interaction", "update_interaction_object", null)
