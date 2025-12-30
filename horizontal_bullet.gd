extends Area2D
var speed=Vector2(-275,0)
var triggered=false

func _physics_process(delta: float) -> void:
	position += speed * delta
	if position.y > get_viewport().size.y + 50:
		queue_free()

func _on_body_entered(body) -> void:
	if body is CharacterBody2D:
		if not body.has_meta("triggered"):
			body.set_meta("triggered", false)

		if body.get_meta("triggered"):
			return

		body.set_meta("triggered", true)
		Audio.get_child(8).play()
		body.die()
	
