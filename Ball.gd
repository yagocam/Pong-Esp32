extends KinematicBody2D
export var velocity = Vector2(0,0)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		velocity.x *= 1.1
		velocity.y *= 1.1
		



	
