extends Node2D

const SPEED = 60

var direction = 1

@onready var raycast_left: RayCast2D = $raycastLEFT
@onready var raycast_right: RayCast2D = $raycastRIGHT
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if raycast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
			
	
	position.x += SPEED * delta * direction
	
	
