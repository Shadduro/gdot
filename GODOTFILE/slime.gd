extends CharacterBody2D

var health = 3
@onready var character = get_node("/root/Game/character")

func _ready():
	%Slime.play_walk()
func _physics_process(delta):
	var direction = global_position.direction_to(character.global_position)
	velocity = direction * 150
	move_and_slide()

func damage():
	health -= 1
	%Slime.play_hurt()
	if health == 0:
		queue_free()
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
