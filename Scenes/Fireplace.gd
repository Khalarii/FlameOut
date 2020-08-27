extends RigidBody2D

var points = 0

func _on_Area2D_body_entered(body):
	if body.collision_layer == 2:
		queue_free()
	else:
		body.queue_free()
		points += 1
