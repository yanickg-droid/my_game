extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var rock_hitbox: CollisionShape2D = $"../rock_hitbox"
@onready var falling_rock: Node2D = $"../.."


func _on_body_entered(_body: Node2D) -> void:
	if _body is CharacterBody2D:
		animated_sprite_2d.play("rock_breaking")
		Audio.get_node('stone_breaking').play()
	
func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite_2d.frame==6:
		rock_hitbox.queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	falling_rock.queue_free()
