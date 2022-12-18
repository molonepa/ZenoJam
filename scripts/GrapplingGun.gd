extends Node2D

export(PackedScene) var rope = preload("res://scenes/Rope.tscn")

var aim_range : int = 64
var hit_position: Vector2 = Vector2.ZERO

onready var aim = $AimDirection
onready var sprite = $Sprite
onready var crosshair = $Crosshair

func update_target(target: Vector2) -> void:
	self.aim.set_cast_to(target.normalized() * self.aim_range)
	self.sprite.rotation = Vector2.RIGHT.angle_to(target.normalized())

	if self.aim.is_colliding():
		hit_position = self.aim.get_collision_point()
	self.crosshair.position = hit_position
	#else:
		#self.crosshair.position = target.normalized() * self.aim_range

func shoot() -> void:
	if self.aim.is_colliding():
		var rope_instance = rope.instance()
		get_tree().get_root().add_child(rope_instance)
		rope_instance.initialise(self.global_position, hit_position)
