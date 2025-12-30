extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var speed=35
var player_chase=false
var player=null
var max_x=0.0
var min_x
var patrol_dirn=1
var is_patrolling=false
var is_attacking=false
var idle_timer=3
var patrol_timer=3
var attack_range=30
var attack_cooldown=1.0
var can_attack=true
var can_player_die
var is_player_dead=false
@onready var character_body: CharacterBody2D = $"../../../player"
@onready var max_distance := 1500.0
@onready var min_db := -40.0
@onready var max_db := 0.0
	
func _process(_delta: float) -> void:
	var dist = global_position.distance_to(character_body.global_position)

	dist = clamp(dist, 0.0, max_distance)

	var t = 1.0 - (dist / max_distance)
	Audio.get_child(15).volume_db = lerp(min_db, max_db, t)
func _ready() -> void:
	max_x=global_position.x
	min_x=max_x-175
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body!=self:
		player_chase=true
		player=body
func _physics_process(_delta: float) -> void:
	
	var direction= sign(player.position.x-position.x) if player else 0
	if player:
		if direction<0:
			animated_sprite_2d.flip_h=false
			collision_shape_2d.position.x=0
		else:
			animated_sprite_2d.flip_h=true
			collision_shape_2d.position.x=5
	if player_chase and player:
		if not is_attacking:
			velocity.x=direction*speed
			animated_sprite_2d.play("walk")
			try_attack()
	else:
		patrol_logic(_delta)
	move_and_slide()
func _on_detection_area_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_chase=false
		player=null
func patrol_logic(delta):
	idle_timer -= delta
	patrol_timer -= delta

	# Switch state when timer ends
	if idle_timer <= 0 and not is_patrolling:
		is_patrolling = true
		patrol_timer = randf_range(1.0, 3.0)
		patrol_dirn = [-1, 1].pick_random()

	if patrol_timer <= 0 and is_patrolling:
		is_patrolling = false
		idle_timer = randf_range(1.0, 3.0)
	if global_position.x >=max_x:
		patrol_dirn = -1
	elif global_position.x <=min_x:
		patrol_dirn = 1
	# Apply movement
	if is_patrolling:
		velocity.x = patrol_dirn * speed
		animated_sprite_2d.play("walk")
	else:
		velocity.x = 0
		animated_sprite_2d.play("idle")
	if patrol_dirn<0:
		animated_sprite_2d.flip_h=false
		collision_shape_2d.position.x=0
	else:
		animated_sprite_2d.flip_h=true
		collision_shape_2d.position.x=5
func try_attack():
	if not can_attack or not player or is_attacking:
		return
	else:
		var dist=global_position.distance_to(player.global_position)
		if dist<=attack_range:
			velocity.x=0
			attack()
func attack():
	if not is_player_dead:
		can_attack=false
		can_player_die=false
		is_attacking=true
		velocity.x=0
		animated_sprite_2d.play("attack")
		await get_tree().create_timer(attack_cooldown).timeout
		can_attack=true
		is_attacking=false
	else:
		velocity.x=0
		animated_sprite_2d.play("idle")
func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite_2d.animation=="attack":
		if animated_sprite_2d.frame==3:
			can_player_die=true
	if animated_sprite_2d.animation=="walk":
		if animated_sprite_2d.frame==1 or animated_sprite_2d.frame==5:
			Audio.get_child(12).play()
	if player:
		var dist=global_position.distance_to(player.global_position)
		if player and player.has_method('die') and can_player_die and dist<=attack_range:
			
			player.die()
			
			is_player_dead=true
