extends Node2D
@onready var timer = $Timer
@onready var time_label = $CanvasLayer/TimeLabel

var time_left := 10

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	timer.start(1.0) # tick every 1 second
	update_label()

func _on_timer_timeout():
	time_left -= 1
	update_label()

	if time_left <= 0:
		timer.stop()
		level_failed()

func update_label():
	time_label.text = "Time_left: %d" % time_left

func level_failed():
	print("Level Failed ⛔")
	get_tree().reload_current_scene()
