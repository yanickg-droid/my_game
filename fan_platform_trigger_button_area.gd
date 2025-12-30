extends Area2D
var a:Tween
var b:Vector2
var c
@onready var fan_platform_trigger_button: Control = $"../../text/fan_platform_trigger_button"
@onready var player: CharacterBody2D = $"../../player"

func _on_body_entered(_body: Node2D) -> void:
	if _body is CharacterBody2D and _body==player:
		a=get_tree().create_tween()
		a.tween_property(fan_platform_trigger_button,"modulate",Color(1,1,1,1),1)
		await get_tree().create_timer(5).timeout
		a=get_tree().create_tween()
		a.tween_property(fan_platform_trigger_button,"modulate",Color(1,1,1,0),1)
