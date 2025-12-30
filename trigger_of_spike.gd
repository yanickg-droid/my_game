extends Area2D
@onready var spike: AnimatedSprite2D = $"../AnimatedSprite2D"
var triggered=false
var victim: CharacterBody2D=null
var a=range(2,17)

func _on_body_entered(_body) -> void:
	if _body is CharacterBody2D:
		victim=_body
		spike.play("spike_emerging")

func _on_animated_sprite_2d_frame_changed() -> void:
	if triggered:
		return
	if spike.animation=="spike_emerging" and spike.frame==2:
		Audio.get_child(9).play()
	if spike.animation == "spike_emerging" and spike.frame in a and victim in self.get_overlapping_bodies():
		triggered = true

		if victim:
			victim.set_physics_process(false)

			var sprite: AnimatedSprite2D = victim.get_node_or_null("AnimatedSprite2D")
			if sprite:
				Audio.get_child(8).play()
				sprite.play("dead")

			await get_tree().create_timer(1.5).timeout
			get_tree().reload_current_scene() # Replace with function body.
