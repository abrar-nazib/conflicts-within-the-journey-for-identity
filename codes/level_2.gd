extends Node2D

#onready??
var stone2 := preload("res://scenes/stones.tscn")

@onready var stone_pos  : Vector2 = Vector2(745,312)
@onready var stone_pos2 : Vector2 = Vector2(2000,465)
@onready var stone_pos3 : Vector2 = Vector2(3366,3)

@onready var gem := load("res://scenes/gems.tscn")


var level1 := load("res://scenes/level_1.tscn")
var level3 := load("res://scenes/level_3.tscn")
var level4 := load("res://scenes/level_4.tscn")
var level5 := load("res://scenes/level_5.tscn")



# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Gemscount.text = "\n\nGems:" + str(Global.gems_collected)
	$HUD/Stonecount.text = "\nStones: " + str(Global.stones_collected)



func _on_door_1_body_entered(body):
	var newlevel = level1.instantiate()
	get_parent().add_child(newlevel)
	queue_free()


func _on_door_2_body_entered(body):
	var newlevel = level3.instantiate()
	get_parent().add_child(newlevel)
	queue_free()
	
	
func _on_door_3_body_entered(body):
	var newlevel = level4.instantiate()
	get_parent().add_child(newlevel)
	queue_free()


func _on_door_4_body_entered(body):
	var newlevel = level5.instantiate()
	get_parent().add_child(newlevel)
	queue_free()




func _on_ready():
	
	if Global.stones_array[4]==1 :
		var newstone=stone2.instantiate()
		newstone.stoneid=4
#		
		add_child(newstone)
		newstone.position=stone_pos
	if Global.stones_array[5]==1 :
		var newstone=stone2.instantiate()
		newstone.stoneid=5
#		
		add_child(newstone)
		newstone.position=stone_pos2
	if Global.stones_array[6]==1 :
		var newstone=stone2.instantiate()
		newstone.stoneid=6

		add_child(newstone)
		newstone.position=stone_pos3



func _on_gameedge_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
