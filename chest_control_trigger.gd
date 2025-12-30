extends Area2D
@onready var chest_opening_button: Control = $"../../text/chest_opening_button"
var a:Tween

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		a=get_tree().create_tween()
		a.tween_property(chest_opening_button,"modulate",Color(1,1,1,1),1.5)
		await get_tree().create_timer(5).timeout
		a=get_tree().create_tween()
		a.tween_property(chest_opening_button,"modulate",Color(1,1,1,0),1.5)
