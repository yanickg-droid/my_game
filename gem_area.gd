extends Area2D
@onready var gem: Node2D = $"../.."


func _on_body_entered(body) -> void:
	if body is CharacterBody2D:
		body.add_gem()
		Audio.get_child(5).play()
		gem.queue_free()
