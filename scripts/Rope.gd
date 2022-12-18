extends Node2D

onready var line = $Line2D
onready var collision = $CollisionShape2D

func _ready():
	pass

func initialise(start: Vector2, end: Vector2) -> void:
	self.line.add_point(start)
	self.line.add_point(end)

	var shape = SegmentShape2D.new()
	shape.a = start
	shape.b = end

	collision.shape = shape
