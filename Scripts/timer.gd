extends Timer

@onready var ray_cast: RayCast2D = $"../RayCast2D"
@onready var timer: Timer = $"."
@export var ammo: PackedScene
