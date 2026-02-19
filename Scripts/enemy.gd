extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health=100
var health_max=100
var health_min=0
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../player"

func _physics_process(_delta: float) -> void:
	var direction_x=sign(player.global_position.x-global_position.x)
	velocity.x=direction_x*50.0
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta
	move_and_slide()

func take_damage(damage:int):
	health-=damage
	if health<=0:
		queue_free()
	

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player2"):
		print("enemy killed you")
		timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()


func _on_detect__wall_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
