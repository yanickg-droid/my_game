extends Area2D

@export var new_background_sprite: Sprite2D


@onready var bg: Sprite2D = $"../CharacterBody2D/Camera2D/Background"

@onready var anim: AnimationPlayer = $ColorRect/AnimationPlayer

var triggered := false

func _on_body_entered(body:CharacterBody2D):
	if triggered:
		return
	if not body.is_in_group("player"):
		return

	triggered = true

	# Fade out screen
	anim.play("fade_out")
	await anim.animation_finished

	# Copy texture from new Sprite2D
	bg.texture = new_background_sprite.texture

	# Optional: match transform
	#bg.flip_h = new_background_sprite.flip_h
	#bg.flip_v = new_background_sprite.flip_v
	#bg.scale  = new_background_sprite.scale

	# Fade in screen
	anim.play("fade_in")
