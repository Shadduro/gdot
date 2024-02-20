extends Node2D

func mob():
	var slime = preload("res://slime.tscn").instantiate()
	%as.progress_ratio = randf()
	slime.global_position = %as.global_position
	add_child(slime)


func _on_timer_timeout():
	mob()


func _on_character_dead():
	%gg.visible = true
	get_tree().paused = true
