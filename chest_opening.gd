extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

var player_inside := false
var is_open := false
var player

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player=body
		player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_inside = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		if not is_open:
			toggle_chest()
			is_open=true
			player.add_gem()
func toggle_chest():
	
	animated_sprite_2d.play("chest_opening")
	Audio.get_child(11).play()
	await get_tree().create_timer(2).timeout
	Audio.get_child(11).stop()
