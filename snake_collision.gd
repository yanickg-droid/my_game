extends Area2D

var triggered := false

func _on_body_entered(body: Node):
	
	if triggered:
		return

	if body is CharacterBody2D:
		triggered = true
		
		body.die()
		
		Audio.get_node('death').stop()
		Audio.get_child(4).play()
		Audio.get_child(4).seek(0.43)
