extends Area2D
@onready var player_camera: Camera2D =$"../../player/player_camera"
@onready var bg_2: Sprite2D = $"../../player/player_camera/bg2"
@onready var bg_1: Sprite2D = $"../../player/player_camera/bg1"
@onready var gem_count: Label = $"../../player/player_camera/gem_count"
var camera_zoom:Tween
@onready var color_rect: ColorRect = $"../../player/ColorRect"
var camera_movement:Tween
var gem_count_movement:Tween
var bg_zoom1:Tween
var bg_zoom2:Tween

func _on_body_entered(body: Node2D) -> void:
	if player_camera.zoom==Vector2(2,2):
		if body is CharacterBody2D:
			camera_zoom=get_tree().create_tween()
			gem_count_movement=get_tree().create_tween()
			camera_movement=get_tree().create_tween()
			camera_zoom.tween_property(player_camera,"zoom",Vector2(1,1),2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			camera_movement.tween_property(player_camera,"position",Vector2(player_camera.position.x+250,player_camera.position.y),2).set_ease(Tween.EASE_IN_OUT)
			gem_count_movement.tween_property(gem_count,"position",Vector2(-1930,-957),2.7)
			bg_zoom1=get_tree().create_tween()
			bg_zoom1.tween_property(bg_2,"scale",Vector2(3.323,3.24),2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			bg_zoom2=get_tree().create_tween()
			bg_zoom2.tween_property(bg_1,"scale",Vector2(3.323,3.24),2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			Audio.get_child(13).stream.loop=true
			Audio.get_child(13).play()
			Audio.get_child(14).stop()
			color_rect.size=Vector2(1160,650)
