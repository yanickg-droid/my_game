extends Control
#@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $NinePatchRect/Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animation_player.play("text_box_loading")
	label.text='Press E to open the chest!'
