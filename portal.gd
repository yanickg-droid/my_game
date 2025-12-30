extends Area2D
@onready var portal: AnimatedSprite2D = $portal
var in_caves=false

func _on_body_entered(_body) -> void:
	if _body is CharacterBody2D:
		if not in_caves:
			self.get_child(0).play("portal_close")
			await get_tree().create_timer(2.5).timeout
			_body.position=Vector2(1000,-1020)
			self.position=Vector2(967,-980)
			self.get_child(0).play("portal_open")
			await portal.animation_finished
			self.get_child(0).play("portal_idle")
			in_caves=true
		else:
			self.get_child(0).play("portal_close")
			await get_tree().create_timer(2.5).timeout
			_body.position=Vector2(194,-675)
			self.position=Vector2(219,-625)
			self.get_child(0).play("portal_open")
			await portal.animation_finished
			self.get_child(0).play("portal_idle")
			in_caves=false
