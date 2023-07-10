extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	Global.gems_collected=0
	Global.stones_array=[1,1,1,1,1,1,1,1,1,1]
	Global.stones_collected=0
	Global.bars=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_button_2_pressed():
	get_tree().quit()
