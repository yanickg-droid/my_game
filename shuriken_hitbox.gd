extends Area2D
var triggered=false

func _on_body_entered(body) -> void:
	if triggered:
		return

	if body is CharacterBody2D:
		triggered = true
		body.set_physics_process(false)

		var sprite = body.get_node_or_null("AnimatedSprite2D")
		
		if sprite!=null:
			sprite.play("dead")
			Audio.get_child(0).play()
	
		await get_tree().create_timer(1.5).timeout 
		get_tree().reload_current_scene()
