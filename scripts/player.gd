extends CharacterBody3D

# How fast the player moves in meters per second.
#@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = -5 #75

@export var speed = 5
@export var gravity = -5

var target = Vector3.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta
	if target:
		var distance = transform.origin.distance_to(target)
		if distance < 1.5:
			target = position
			velocity = Vector3.ZERO
		else:
			look_at(target, Vector3.UP)
			rotation.x = 0
			velocity = -transform.basis.z * speed
		if velocity and velocity != Vector3.ZERO:
			move_and_slide()
