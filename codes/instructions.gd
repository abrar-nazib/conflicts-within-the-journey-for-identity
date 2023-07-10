extends Node2D

@onready var level1 := load("res://scenes/level_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_start_pressed():
	var newlevel = level1.instantiate()
	get_parent().add_child(newlevel)
	queue_free()
