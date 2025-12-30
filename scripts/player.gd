extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var bg_1: Sprite2D = $player_camera/bg1
@onready var bg_2: Sprite2D = $player_camera/bg2
@onready var cam: Camera2D = $player_camera
@onready var collision_stand: CollisionShape2D=$CollisionShapeStanding
@onready var collision_crouch: CollisionShape2D=$CollisionShapeCrouch
@onready var gem_count: Label = $player_camera/gem_count
@onready var double_jump_unlock_label: Label = $player_camera/double_jump_unlocked

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var is_attacking=false
var can_double_jump=true
var is_crouching=false
var is_standing_up=false
var no_of_gems=0
var double_jump_unlocked=false
var can_jump=!is_crouching

func double_jump():
	if is_on_floor():
		can_double_jump = true

	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			Audio.get_child(6).play()
		elif can_double_jump:
			velocity.y = JUMP_VELOCITY
			Audio.get_child(6).play()
			can_double_jump = false

func _physics_process(delta: float) -> void:
	#print(position)
	if is_standing_up:
		if animated_sprite.is_playing():
			return
		else:
			is_standing_up = false

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and can_jump and !double_jump_unlocked:
		velocity.y = JUMP_VELOCITY
		Audio.get_child(6).play()
	elif can_jump and double_jump_unlocked:
		double_jump()

	var direction := Input.get_axis("left", "right")

	if direction>0:
		animated_sprite.flip_h=false
		collision_stand.position.x=0
		collision_crouch.position.x=0
	elif direction<0:
		animated_sprite.flip_h=true
		collision_stand.position.x=10
		collision_crouch.position.x=10
		
	if is_on_floor():
		if Input.is_action_pressed("crouch"):
			is_crouching=true
			animated_sprite.play("Crouch")
			collision_stand.disabled=true
			collision_crouch.disabled=false
			if animated_sprite.animation=='Crouch':
				if animated_sprite.frame==1:
					animated_sprite.frame=1
		elif Input.is_action_just_released("crouch"):
			is_crouching=false
			is_standing_up=true
			collision_stand.disabled=false
			collision_crouch.disabled=true
			animated_sprite.play_backwards("Crouch")
		elif direction==0 :
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	elif !is_on_floor():
		animated_sprite.play('jump')
			
	if direction and !Input.is_action_pressed("attack") and !is_crouching:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func die():
	# Prevent death from running more than once
	if has_meta("dead") and get_meta("dead"):
		return

	set_meta("dead", true)

	if !get_tree().paused:
		set_physics_process(false)
		animated_sprite.play("dead")
		Audio.get_child(8).play()

		collision_stand.set_deferred("disabled", true)
		await get_tree().create_timer(1.5).timeout
		get_tree().reload_current_scene()

func _on_world_boundary_body_entered(_body: Node2D) -> void:
	Audio.get_child(8).play()
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()
func add_gem():
	no_of_gems+=1
	gem_count.text='Gems Collected : '+str(no_of_gems)
	if no_of_gems>=5:
		double_jump_unlocked=true
		double_jump_unlock_label.text='You\'ve unlocked Double Jump! Press W twice!'
		double_jump_unlock_label.visible=true
		await get_tree().create_timer(4).timeout
		double_jump_unlock_label.visible=!true
