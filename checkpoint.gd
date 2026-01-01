extends Area2D
var triggered=false

func _on_body_entered(_body: Node2D) -> void:
	if not triggered:
		Audio.get_node('checkpoint').play()
		Game.set_checkpoint(global_position)
		triggered=true
