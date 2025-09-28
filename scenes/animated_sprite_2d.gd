extends Node2D

const SPEED = 60

var direction = 1
@onready var raycast_left: RayCast2D = $"../raycastLEFT"
@onready var raycast_right: RayCast2D = $"../raycastRIGHT"


func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction = -1
	if raycast_left.is_colliding():
		direction = 1
	
	position.x += SPEED * delta * direction
	
