extends CharacterBody2D

signal dead()
var health = 100.00

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
	const OUCH = 5.00
	var t = %hitbox.get_overlapping_bodies()
	if t.size()>0:
		health -= OUCH * t.size() * delta
		%bar.value = health
		if health <= 0.00:
			dead.emit()
