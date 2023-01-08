extends Node2D

export(PackedScene) var rope = preload("res://scenes/Rope.tscn")
export(int) var aim_range = 10

var hit_position: Vector2 = Vector2.ZERO

var _rope_instance_id : int = -1

onready var aim = $AimDirection
onready var sprite = $Sprite

func update_target(target: Vector2) -> void:
	self.aim.set_cast_to(target.normalized() * self.aim_range * 16)

	self.sprite.rotation = Vector2.RIGHT.angle_to(target.normalized())

	if self.aim.is_colliding():
		hit_position = self.aim.get_collision_point()

func shoot() -> void:
	if self.aim.is_colliding():
		if _rope_instance_id != -1:
			_delete_rope()
		var rope_instance = rope.instance()
		get_tree().get_root().add_child(rope_instance)
		rope_instance.initialise(self.global_position, hit_position)
		_rope_instance_id = rope_instance.get_instance_id()

func _delete_rope() -> void:
	instance_from_id(_rope_instance_id).queue_free()
	_rope_instance_id = -1
