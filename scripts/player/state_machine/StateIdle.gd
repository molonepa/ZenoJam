extends PlayerState

func update(_delta: float) -> void:
	if !self.player.is_on_floor():
		state_machine.transition_to("Fall")
		return

	self.player.velocity = Vector2.ZERO

	self.player.update_visuals(self.name)

func handle_input() -> void:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		state_machine.transition_to("Walk")

	if Input.is_action_just_pressed("interact"):
		state_machine.transition_to("Interact")

	if Input.is_action_pressed("shoot"):
		state_machine.transition_to("Shoot")
