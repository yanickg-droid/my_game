extends Sprite2D

@onready var camera := get_viewport().get_camera_2d()

func _ready():
	var screen_size = get_viewport_rect().size
	var texture_size = texture.get_size()

	scale = screen_size / texture_size
	global_position = camera.global_position
