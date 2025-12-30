extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Engine.time_scale=0.1
		Audio.get_child(13).stop()
		Audio.get_child(14).stop()
		Audio.get_child(16).play()
