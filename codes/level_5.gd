extends Node2D

var stone5 := load("res://scenes/stones.tscn")

@onready var stone_pos  : Vector2 = Vector2(2783,450)

@onready var gem := load("res://scenes/gems.tscn")


var level1 := load("res://scenes/level_1.tscn")
var level2 := load("res://scenes/level_2.tscn")
var level3 := load("res://scenes/level_3.tscn")
var level4 := load("res://scenes/level_4.tscn")
var level6 := load("res://scenes/level_6.tscn")


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Gemscount.text = "Gems:" + str(Global.gems_collected)
	$HUD/Stonecount.text = "Stones: " + str(Global.stones_collected)


func _on_door_1_body_entered(body):
	var newlevel = level1.instantiate()
	get_parent().add_child(newlevel)
	queue_free()


func _on_door_2_body_entered(body):
	var newlevel = level2.instantiate()
	get_parent().add_child(newlevel)
	queue_free()


func _on_door_3_body_entered(body):
	var newlevel = level3.instantiate()
	get_parent().add_child(newlevel)
	queue_free()


func _on_door_4_body_entered(body):
	var newlevel = level4.instantiate()
	get_parent().add_child(newlevel)
	queue_free()

func _ready():
	if Global.stones_array[9]==1 :
		var newstone=stone5.instantiate()
		newstone.stoneid=9
#		
		add_child(newstone)
		newstone.position=stone_pos
	


func _on_gameedge_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")


func _on_door_5_body_entered(body):
	if Global.stones_collected==10 :
		var newlevel = level6.instantiate()
		get_parent().add_child(newlevel)
		queue_free()
