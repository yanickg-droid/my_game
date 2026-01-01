extends Control
@onready var fade_animation: AnimationPlayer =$ColorRect2/fade_animation

func _ready() -> void:
	fade_animation.play('fade_in')
