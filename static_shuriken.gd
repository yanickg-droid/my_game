extends Node2D
@export var character_body: CharacterBody2D
@onready var max_distance := 1000.0
@onready var min_db := -40.0
@onready var max_db := 10.0
func _process(_delta: float) -> void:
	var dist = global_position.distance_to(character_body.global_position)

	dist = clamp(dist, 0.0, max_distance)

	var t = 1.0 - (dist / max_distance)
	Audio.get_child(3).volume_db = lerp(min_db, max_db, t)
func _ready() -> void:
	var rotation_sound=Audio.get_child(3).stream as AudioStreamWAV
	rotation_sound.loop_mode=AudioStreamWAV.LOOP_FORWARD
	#Audio.get_child(3).play()
