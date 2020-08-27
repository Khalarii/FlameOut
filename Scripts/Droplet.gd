extends Objects

onready var animation:AnimationPlayer = get_node("AnimationPlayer")

var prev_direction = 0

func _physics_process(delta: float) -> void:
	var direction:= Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		1.0
	)
	velocity = speed * direction
	
	var current_direction = direction.x
	
	if current_direction != prev_direction:
		if current_direction > 0:
			if prev_direction == 0:
				animation.play("rotate_left")
			elif prev_direction > 0:
				animation.connect("animation_finished", self, "play_next_animation")
				animation.play("center")
		elif current_direction < 0:
			if prev_direction == 0:
				animation.play("rotate")
			elif prev_direction < 0:
				animation.connect("animation_finished", self, "play_next_animation")
				animation.play("center_from_left")
		else:
			if prev_direction < 0:
				animation.play("center")
			else:
				animation.play("center_from_left")
		
	prev_direction = current_direction
	velocity = move_and_slide(Vector2(velocity))
	
func play_next_animation():
	if animation.current_animation() == "center":
		animation.play("rotate_left")
	elif animation.current_animation() == "center_from_left":
		animation.play("rotate")
