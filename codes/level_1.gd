extends Node2D

@onready var stone := load("res://scenes/stones.tscn")

@onready var stone_pos  : Vector2 = Vector2(1610,239)
@onready var stone_pos2 : Vector2 = Vector2(1439,432)
@onready var stone_pos3 : Vector2 = Vector2(1301,320)
@onready var stone_pos4 : Vector2 = Vector2(1831,220)

@onready var gem := load("res://scenes/gems.tscn")

@onready var level2 := load("res://scenes/level_2.tscn")
@onready var level3 := load("res://scenes/level_3.tscn")
@onready var level4 := load("res://scenes/level_4.tscn")
@onready var level5 := load("res://scenes/level_5.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/Gemscount.text = "Gems: " + str(Global.gems_collected)
	$HUD/Stonecount.text = "Stones: " + str(Global.stones_collected)




func _on_door_1_body_entered(body):
#	get_tree().change_scene_to_file("res://level_2.tscn")
	var newlevel = level2.instantiate()
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
	
	if Global.stones_array[0]==1 :
		var newstone=stone.instantiate()
		newstone.stoneid=0
#		
		add_child(newstone)
		newstone.position=stone_pos
	if Global.stones_array[1]==1 :
		var newstone=stone.instantiate()
		newstone.stoneid=1
#		
		add_child(newstone)
		newstone.position=stone_pos2
	if Global.stones_array[2]==1 :
		var newstone=stone.instantiate()
		newstone.stoneid=2
		
		add_child(newstone)
		newstone.position=stone_pos3
	if Global.stones_array[3]==1 :
		var newstone=stone.instantiate()
		newstone.stoneid=3
		
		add_child(newstone)
		newstone.position=stone_pos4





func _on_gameedge_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
