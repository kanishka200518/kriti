extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 180.0
const JUMP_VELOCITY = -400.0
var health=100
var health_max=100
var health_min=0

func take_damage(damage:int):
	health-=damage
	if health<=0:
		die()

func die():
	get_tree().reload_current_scene()
	print("dead")

func _physics_process(_delta: float) -> void:
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony=Input.get_axis("ui_up","ui_down") 
	if directiony:
		velocity.y=directiony * SPEED
	else:
		velocity.y=move_toward(velocity.y,0,SPEED)
	
	if direction > 0:
		animated_sprite_2d.flip_h = true   # face left
	elif direction <0:
		animated_sprite_2d.flip_h = false  # face right
	
	
	if velocity.x != 0 :
		animated_sprite_2d.play("run")
	elif  directiony > 0:
		animated_sprite_2d.play("down")
	elif directiony <0:
		animated_sprite_2d.play("up")
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()

	
