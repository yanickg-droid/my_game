extends Area2D
@onready var animation_player: AnimationPlayer = $"../AnimatableBody2D/AnimationPlayer"
@onready var area_2d: Area2D = $"."
@onready var player: CharacterBody2D = $"../../../player"
var is_triggered=false
var can_trigger=false

func _process(_delta: float) -> void:
	if animation_player.current_animation!="jerk_down":
		if Input.is_action_pressed("interact") and not is_triggered and can_trigger:
			animation_player.play_section("move_upwards",0.0,8.0)
			area_2d.monitoring=false
			is_triggered=true
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		animation_player.play("jerk_down")
		can_trigger=true
