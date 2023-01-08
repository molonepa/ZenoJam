extends HealthManager

signal player_health_depleted

var player: Player

func _ready() -> void:
	yield(owner, "ready")
	player = owner as Player
	assert(player != null)

	max_health = 3
	current_health = max_health

func _process(_delta):
	if current_health == 0:
		emit_signal("player_health_depleted")
