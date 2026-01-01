extends Area2D
var triggered=false

func _on_body_entered(_body) -> void:
	#if triggered:
		#return

	if _body is CharacterBody2D:
		#if not _body.has_meta("triggered"):
			#_body.set_meta("triggered", false)
#
		#if _body.get_meta("triggered"):
			#return
#
		#_body.set_meta("triggered", true)
		Audio.get_node("shuriken_death").play()
		_body.die()
		Audio.get_node('death').stop()
