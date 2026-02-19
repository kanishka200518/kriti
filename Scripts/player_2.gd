extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var health=100
var health_max=100
var health_min=0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func take_damage(damage:int):
	health-=damage
	if health<=0:
		die()

func die():
	get_tree().reload_current_scene()
	print("dead")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction < 0:
		animated_sprite_2d.flip_h = true   # face left
	elif direction > 0:
		animated_sprite_2d.flip_h = false  # face right
		
	if velocity.x != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()

	
