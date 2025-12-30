extends Button

func _on_pressed() -> void:
	Audio.get_child(7).play()
	Audio.get_child(14).stream.loop=true
	Audio.get_child(14).play()
	get_tree().change_scene_to_file('res://game.tscn')
