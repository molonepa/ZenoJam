extends PlayerState

var _position_tween : Tween
var _rope_object : Object = null

func update_interaction_object(object) -> void:
	_rope_object = object

func update(_delta: float) -> void:
	self.player.update_visuals(self.name)

func enter(_msg:= {}) -> void:
	_position_tween = Tween.new()
	self.add_child(_position_tween)

	var start = self.player.global_position
	var end = _rope_object.line.points[1]
	var time = start.distance_to(end) / 10

	_position_tween.interpolate_property(self.player, "global_position", start, end, time)
	_position_tween.start()

func handle_input():
	if Input.is_action_just_pressed("release"):
		_position_tween.stop_all()
		state_machine.transition_to("Idle")
