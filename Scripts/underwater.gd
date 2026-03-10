extends Node2D

@export var enemy_scene: PackedScene # Drag your enemy.tscn here in the Inspector
@onready var spawn_timer: Timer = $spawn_timer
@onready var player: CharacterBody2D = $player

var spawn_radius = 400.0 # Distance from player to spawn

func _ready() -> void:
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start(3.0) # Spawn every 3 seconds

func _on_spawn_timer_timeout() -> void:
	if enemy_scene:
		spawn_enemy()

func spawn_enemy():
	# 1. Create the instance
	var new_enemy = enemy_scene.instantiate()
	new_enemy.player=player
	
	# 2. Pick a random direction (0 to 360 degrees)
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	
	# 3. Position it relative to the player
	var spawn_pos = player.global_position + (random_direction * spawn_radius)
	
	# 4. Add it to the scene tree
	new_enemy.global_position = spawn_pos
	add_child(new_enemy)
