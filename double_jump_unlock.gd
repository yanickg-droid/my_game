extends Area2D

@onready var double_jump_condition: Label = $"../../player/player_camera/double_jump_condition"

var triggered=false

func _on_body_entered(body: Node2D) -> void:
	
	if body is CharacterBody2D and triggered==false:
		triggered=true
		double_jump_condition.visible=true
		await get_tree().create_timer(5).timeout
		double_jump_condition.visible=false
		
