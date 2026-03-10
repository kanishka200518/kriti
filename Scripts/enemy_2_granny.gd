extends CharacterBody2D
@onready var player: CharacterBody2D = $"../../player"


const SPEED = 70.0
var health=100
var health_max=100
var health_min=0
@onready var timer: Timer = $Timer
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var timer_2: Timer = $Timer2

func _physics_process(_delta: float) -> void:
	var dir=to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity=dir*SPEED
	move_and_slide()

func makepath():
	if player.collision_layer==4:
		navigation_agent_2d.target_position=player.global_position
	else:
		navigation_agent_2d.target_position=global_position
	
func take_damage(damage:int):
	health-=damage
	if health<=0:
		queue_free()
	

	

func _on_timer_timeout():
	get_tree().reload_current_scene()





func _on_timer_2_timeout() -> void:
	makepath()
