extends Control

@onready var label: Label = $NinePatchRect/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text='Press E to ascend!'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
