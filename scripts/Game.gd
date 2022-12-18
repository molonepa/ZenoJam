extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta) -> void:
	process_inputs()

func process_inputs() -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
