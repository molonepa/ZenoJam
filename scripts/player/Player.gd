class_name Player
extends KinematicBody2D

var velocity : Vector2 = Vector2.ZERO

onready var animation_player = $Graphics/AnimationPlayer
onready var sprite = $Graphics/Sprite
onready var gun = $Items/GrapplingGun
onready var health_manager = $HealthManager
onready var ground_ray = $GroundRay
onready var state_label = $Graphics/StateLabel

func _ready() -> void:
	health_manager.connect("player_health_depleted", self, "_on_health_depleted")

func _process(_delta: float) -> void:
	gun.update_target(get_local_mouse_position())

func _physics_process(_delta: float) -> void:
	move_and_slide(self.velocity, Vector2.UP)

func update_visuals(state_name) -> void:
	state_label.set_text(state_name)

	_play_animation(state_name)

	if self.velocity.x > 0:
		sprite.flip_h = false
	elif self.velocity.x < 0:
		sprite.flip_h = true

func is_on_floor() -> bool:
	return ground_ray.is_colliding()

func _play_animation(animation_name) -> void:
	if self.animation_player.is_playing() and self.animation_player.current_animation == animation_name:
		return

	self.animation_player.play(animation_name)

func _on_health_depleted() -> void:
	get_tree().change_scene("res://scenes/Lose.tscn")
