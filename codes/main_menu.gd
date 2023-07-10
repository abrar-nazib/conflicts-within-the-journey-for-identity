extends Node2D

var level := load("res://scenes/instructions.tscn")

func _on_play_pressed():
#	get_tree().change_scene_to_file("res://level_1.tscn")
	var newlevel = level.instantiate()
	get_parent().add_child(newlevel)
	queue_free()

