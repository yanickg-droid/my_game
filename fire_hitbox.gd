extends Area2D
@onready var max_distance := 1500.0
@onready var min_db := -40.0
@onready var max_db := 0.0
@onready var character_body: CharacterBody2D = $"../../../player"
func _process(_delta: float) -> void:
	var dist = global_position.distance_to(character_body.global_position)

	dist = clamp(dist, 0.0, max_distance)

	var t = 1.0 - (dist / max_distance)
	Audio.get_child(10).volume_db = lerp(min_db, max_db, t)
func _ready() -> void:
	Audio.get_child(10).play()
func _on_body_entered(_body) -> void:
	if _body is CharacterBody2D:
		if not _body.has_meta("triggered"):
			_body.set_meta("triggered", false)

		if _body.get_meta("triggered"):
			return

		_body.set_meta("triggered", true)
		Audio.get_child(8).play()
		_body.die()
		
