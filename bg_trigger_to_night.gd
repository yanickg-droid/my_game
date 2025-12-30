extends Area2D

@export var bg1: Sprite2D
@export var bg2: Sprite2D
@export var anim: AnimationPlayer

var current_bg: Sprite2D  

func _ready():
	current_bg = bg2
	#body_entered.connect(_on_body_entered)

func _on_body_entered(_body) -> void:
	if _body is CharacterBody2D:
		var target_bg: Sprite2D = bg1 

		if target_bg != current_bg:
			await get_tree().create_timer(01).timeout
			await _swap_background(target_bg)

func _swap_background(target_sprite: Sprite2D) -> void:
	anim.play("fade_out")
	await anim.animation_finished

	current_bg.visible = false
	target_sprite.visible = true

	anim.play("fade_in")
