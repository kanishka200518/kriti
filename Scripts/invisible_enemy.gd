extends Node2D
@onready var enemy: Node = $enemy
@onready var timer: Timer = $Timer



func _on_timer_timeout() -> void:
	enemy.visible=false
