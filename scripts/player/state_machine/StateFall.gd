extends PlayerState

export(int) var gravity = 150

func update(_delta: float) -> void:
	if self.player.is_on_floor():
		state_machine.transition_to("Idle")
		return

	self.player.update_visuals(self.name)

func physics_update(_delta: float) -> void:
	self.player.velocity = Vector2(0, gravity)
