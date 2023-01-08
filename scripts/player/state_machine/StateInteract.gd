extends PlayerState

var _interaction_object : Object = null

func update_interaction_object(object) -> void:
	_interaction_object = object

func update(_delta: float) -> void:
	if !_interaction_object:
		return

	var type = _interaction_object.get_class()
	match(type):
		"Rope":
			state_machine.transition_to("Climb")
		_:
			return

	self.player.update_visuals(self.name)

func physics_update(_delta: float) -> void:
	pass

func handle_input() -> void:
	if Input.is_action_just_released("interact"):
		state_machine.transition_to("Idle")
