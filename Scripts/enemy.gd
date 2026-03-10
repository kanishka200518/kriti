extends CharacterBody2D

const SPEED = 150.0 # Slowed down for better control
const JUMP_VELOCITY = -400.0
var health_max=100
@onready var timer: Timer = $Timer
@onready var floor_checker: RayCast2D = $RayCast2D

var health_min=0
var health = 100
@onready var player: CharacterBody2D = $"../CharacterBody2D"

func _physics_process(delta: float) -> void:
	# 1. Handle Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. Calculate Direction to Player
	var direction_x = sign(player.global_position.x - global_position.x)
	
	# 3. Position the RayCast based on movement direction
	# This ensures the ray looks ahead of where the enemy is moving
	floor_checker.position.x = direction_x * 20 

	# 4. Intelligence Check: Only move if there is floor ahead
	if is_on_floor():
		if floor_checker.is_colliding():
			# Floor exists, proceed to follow player
			velocity.x = direction_x * SPEED
		else:
			# Edge detected! Stop moving to avoid falling
			velocity.x = 0
	
	move_and_slide()

# --- Rest of your existing functions ---

func take_damage(damage: int):
	health -= damage
	if health <= 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player2"):
		print("enemy killed you")
		timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()

# Logic for jumping over walls
func _on_detect__wall_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
