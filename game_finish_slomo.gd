extends Area2D
@onready var player: CharacterBody2D = $"../../player"
var triggered=false
@onready var fade_animation: AnimationPlayer = $"../../player/ColorRect/fade_animation"
func _on_body_entered(body: Node2D) -> void:
	if not triggered:
		if body is CharacterBody2D:
			triggered=true
			Engine.time_scale=0.1
			Audio.get_child(13).stop()
			Audio.get_child(14).stop()
			Audio.get_child(16).play()
