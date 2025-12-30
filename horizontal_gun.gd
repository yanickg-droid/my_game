extends AnimatedSprite2D
@onready var muzzle: Marker2D = $muzzle
var bullet_scene=preload("res://horizontal_bullet.tscn")
@onready var character_body: CharacterBody2D = $"../../../player"
@onready var max_distance := 1500.0
@onready var min_db := -50.0
@onready var max_db := -10.0
	
func _process(_delta: float) -> void:
	var dist = global_position.distance_to(character_body.global_position)

	dist = clamp(dist, 0.0, max_distance)

	var t = 1.0 - (dist / max_distance)
	Audio.get_child(1).volume_db = lerp(min_db, max_db, t)
func spawn_bullet():
	var bullet=bullet_scene.instantiate()
	bullet.global_position = muzzle.global_position
	get_tree().current_scene.add_child(bullet)
	
	Audio.get_child(1).play()
	
func _on_frame_changed() -> void:
	if frame==6:
		spawn_bullet()
