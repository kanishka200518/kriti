extends Node2D
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $player

var player_vis=true

var time_left=2
func _ready():
	timer.timeout.connect(_on_timer_timeout)
	timer.start(1.0) # tick every 1 second
	if player_vis==false:
		player.visible=false

func _on_timer_timeout():
	time_left -= 1
	

	if time_left <= 0:
		player_vis=false
		player.visible=false

		timer.stop()
