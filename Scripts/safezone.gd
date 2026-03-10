extends Area2D
@onready var player: CharacterBody2D = $"../player"

@onready var tile_map_layer_3: TileMapLayer = $"../TileMapLayer3"

var healing=false 

func _ready() -> void:
	tile_map_layer_3.visible=false

func _physics_process(delta: float) -> void:
	if not is_instance_valid(player): return
	if healing and player.health<50:
		player.health+=delta*10
		
	elif player.health>50:
		healing=false
		
	


func _on_body_entered(_body: Node2D) -> void:
	if _body==player :
		
		healing=true
		_body.collision_layer=8

func _on_body_exited(_body: Node2D) -> void:
	if _body==player:
		healing=false
		_body.collision_layer=4


func _on_area_entered(_area: Area2D) -> void:
	tile_map_layer_3.visible=true


func _on_area_exited(_area: Area2D) -> void:
	tile_map_layer_3.visible=false
	
