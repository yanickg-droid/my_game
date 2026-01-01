extends Node

var checkpoint_position: Vector2 = Vector2.ZERO
const STARTING_POINT := Vector2(-32, -25)

func set_checkpoint(pos: Vector2) -> void:
	checkpoint_position = pos

func respawn() -> void:
	get_tree().reload_current_scene()
