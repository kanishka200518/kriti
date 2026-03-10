extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const MAX_SPEED = 130.0
const ACCELERATION = 800.0  # How fast you speed up
const FRICTION = 400.0      # How fast you drift to a stop

var health = 100
var health_max=100

var health_min=0
func _physics_process(delta: float) -> void:
	# 1. Get Input Vector (Combined X and Y for smoother diagonals)
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2. Apply Acceleration if moving
	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * MAX_SPEED, ACCELERATION * delta)
	else:
		# 3. Apply Friction (Drifting) if not moving
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	# 4. Handle Visuals (Flipping)
	if input_dir.x > 0:
		animated_sprite_2d.flip_h = true   # face right (standard)
	elif input_dir.x < 0:
		animated_sprite_2d.flip_h = false  # face left
	
	# 5. Play Animations
	if velocity.length() > 10:
		animated_sprite_2d.play("float")
		# Optional: Tilt the sprite slightly towards the movement direction
		animated_sprite_2d.rotation = lerp_angle(animated_sprite_2d.rotation, input_dir.x * 0.2, 0.1)
	else:
		animated_sprite_2d.play("float")
		animated_sprite_2d.rotation = lerp_angle(animated_sprite_2d.rotation, 0, 0.1)

	move_and_slide()

func take_damage(damage: int):
	health -= damage
	if health <= 0:
		die()

func die():
	get_tree().reload_current_scene()
