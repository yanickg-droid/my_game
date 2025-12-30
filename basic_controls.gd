extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $NinePatchRect/Label


func _ready() -> void:
	animation_player.play("text_box_loading")
	label.text='W - Jump
				A - Move Left
				D - Move Right
				S - Crouch'
