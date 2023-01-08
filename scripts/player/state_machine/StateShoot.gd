extends PlayerState

func handle_input() -> void:
	if Input.is_action_just_released("shoot"):
		player.update_visuals("Shoot")
		self.player.gun.shoot()
		state_machine.transition_to("Idle")
