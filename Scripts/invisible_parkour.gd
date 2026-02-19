extends Node2D

@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var timer: Timer = $Timer
var time_left=2
func _ready():
	timer.timeout.connect(_on_timer_timeout)
	timer.start(1.0) # tick every 1 second
	

func _on_timer_timeout():
	time_left -= 1
	

	if time_left <= 0:
		tile_map_layer_2.visible=false
		timer.stop()
