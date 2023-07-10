extends Node2D

var stone3 := preload("res://scenes/stones.tscn")

@onready var stone_pos1  : Vector2 = Vector2(343,924)
@onready var stone_pos2 : Vector2 = Vector2(2001,173)


@onready var gem := load("res://scenes/gems.tscn")

var level1 := load("res://scenes/level_1.tscn")
var level2 := load("res://scenes/level_2.tscn")
var level4 := load("res://scenes/level_4.tscn")
var level5 := load("res://scenes/level_5.tscn")

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Gemscount.text = "Gems:" + str(Global.gems_collected)
	$HUD/Stonescount.text = "Stones: " + str(Global.stones_collected)


func _on_door_1_body_entered(body):
	var newlevel = level1.instantiate()
	get_parent().add_child(newlevel)
	queue_free()


func _on_door_2_body_entered(body):
	var newlevel = level2.instantiate()
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
	
	
func _ready():
	if Global.stones_array[7]==1 :
		var newstone=stone3.instantiate()
		newstone.stoneid=7
#		
		add_child(newstone)
		newstone.position=stone_pos1
	if Global.stones_array[8]==1 :
		var newstone=stone3.instantiate()
		newstone.stoneid=8
#		
		add_child(newstone)
		newstone.position=stone_pos2


func _on_gameedge_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
