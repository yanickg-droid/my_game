extends Node2D

func _on_bullet_delete_area_entered(area: Area2D) -> void:
	#if area==vertical_bullet or area==horizontal_bullet:
		area.get_parent().queue_free() # Replace with function body.
