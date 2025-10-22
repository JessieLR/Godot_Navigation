class_name Player extends CharacterBody2D

const speed := 300

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down").normalized()
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
