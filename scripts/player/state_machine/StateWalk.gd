extends PlayerState

export(int) var movement_speed = 50

func update(_delta: float) -> void:
	if !self.player.is_on_floor():
		state_machine.transition_to("Fall")
		return

	self.player.update_visuals(self.name)

func physics_update(_delta: float) -> void:
	pass

func handle_input() -> void:
	if Input.is_action_pressed("move_left"):
		self.player.velocity.x = -movement_speed
	elif Input.is_action_pressed("move_right"):
		self.player.velocity.x = movement_speed
	else:
		state_machine.transition_to("Idle")
