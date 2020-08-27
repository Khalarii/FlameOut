extends KinematicBody2D
class_name Objects

export var speed:= Vector2(200.0, 1000.0)
export var gravity:= 1000.0
var velocity:= Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
