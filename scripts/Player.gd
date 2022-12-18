extends KinematicBody2D

# exported variables
export(int) var gravity = 150

# public variables
var direction : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO
var movement_speed : int = 50

# private variables

# onready variables
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite
onready var gun = $GrapplingGun


# built-in methods
func _ready() -> void:
	pass

func _process(_delta) -> void:
	process_movement()
	update_visuals()

func _physics_process(_delta) -> void:
	process_gun()


# public methods
func process_movement() -> void:
	# horizontal direciton
	if Input.is_action_pressed("move_right"):
		self.direction.x = 1
	elif Input.is_action_pressed("move_left"):
		self.direction.x = -1
	else:
		self.direction.x = 0

	# vertical direction
	if !is_on_floor():
		self.direction.y = 1
	else:
		self.direction.y = 0

	# velocity calculation and movement
	self.velocity.x = self.direction.x * self.movement_speed
	self.velocity.y = self.direction.y * self.gravity
	move_and_slide(self.velocity, Vector2.UP)

func process_gun() -> void:
	self.gun.update_target(get_local_mouse_position())

	if Input.is_action_just_pressed("shoot"):
		self.gun.shoot()

func update_visuals() -> void:
	if self.direction.x != 0 or self.direction.y != 0:
		_play_animation("walk")
		if self.direction.x > 0:
			self.sprite.flip_h = false
		elif self.direction.x < 0:
			self.sprite.flip_h = true
	else:
		_play_animation("idle")


# private methods
func _play_animation(animation_name):
	if self.animation_player.is_playing() and self.animation_player.current_animation == animation_name:
		return

	self.animation_player.play(animation_name)
