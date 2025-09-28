extends CharacterBody2D
# I sacrificed my sleep to make this lmao i forgot to bring my laptop
# its impossible to find good sprite sheets on google -_-
# wanted to add a cool boss fight idk

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# i changed the jum buttons c:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("move_left", "move_right")
	
	#this is for changing is direction accoriding to buttons
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
		
		
	# what animation should the character play during these conditions
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
		
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
