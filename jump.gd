extends Sprite2D


# original image is 256px
var desired_size = 33
var original_size = texture.get_size().x

var factor = desired_size / original_size
func _process(delta: float) -> void:
	scale = Vector2(factor, factor)	
