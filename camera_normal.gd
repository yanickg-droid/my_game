extends Area2D

@onready var player_camera: Camera2D = $"../../player/player_camera"
@onready var bg_1: Sprite2D = $"../../player/player_camera/bg1"
@onready var bg_2: Sprite2D = $"../../player/player_camera/bg2"
@onready var gem_count: Label = $"../../player/player_camera/gem_count"

var is_cinematic_view = true

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if is_cinematic_view and body is CharacterBody2D:

			# Camera zoom tween
			var camera_zoom_tween = get_tree().create_tween()
			var action = camera_zoom_tween.tween_property(player_camera, "zoom", Vector2(2, 2), 2)
			action.set_trans(Tween.TRANS_SINE)
			action.set_ease(Tween.EASE_IN_OUT)

			# Camera position tween
			var camera_move_tween = get_tree().create_tween()
			var move_action = camera_move_tween.tween_property(player_camera, "position", Vector2(0, 0), 2)
			move_action.set_trans(Tween.TRANS_SINE)
			move_action.set_ease(Tween.EASE_IN_OUT)

			# Gem count position tween
			var gem_tween = get_tree().create_tween()
			gem_tween.tween_property(gem_count, "position", Vector2(-963, -482), 1.7)

			# Background zoom tween
			var bg_tween = get_tree().create_tween()
			var bg_action = bg_tween.tween_property(bg_2, "scale", Vector2(1.654,1.602), 2)
			bg_action.set_trans(Tween.TRANS_SINE)
			bg_action.set_ease(Tween.EASE_IN_OUT)
			var bg_twee = get_tree().create_tween()
			var bg_actio = bg_twee.tween_property(bg_1, "scale", Vector2(1.654,1.602), 2)
			bg_actio.set_trans(Tween.TRANS_SINE)
			bg_actio.set_ease(Tween.EASE_IN_OUT)
