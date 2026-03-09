extends CharacterBody2D
@onready var level_2: Area2D = $"../level2"
@onready var player: CharacterBody2D = $"../player"
@onready var area_2d: Area2D = $"../player/Area2D"


const SPEED = 70.0
var health=100
var health_max=100
var health_min=0
var dir
var enemy
var enemy_mode=false
func _physics_process(_delta: float) -> void:
	if is_instance_valid(enemy)==false:
		enemy_mode=false

	if enemy_mode==false:
		dir = global_position.direction_to(level_2.global_position)
	else:
		dir = global_position.direction_to(enemy.global_position)
	
	velocity=dir*SPEED
	move_and_slide()



	
func take_damage(damage:int):
	health-=damage
	if health<=0:
		queue_free()
	

	


func _on_area_2d_body_entered(_body: Node2D) -> void:
	enemy=_body
	enemy_mode=true
