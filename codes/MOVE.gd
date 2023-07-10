extends Node2D


# Called when the node enters the scene tree for the first time.
@export var id : int= 0


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.bars[4]==0 :
		$Platform/AnimationPlayer.pause()
	else : 
		$Platform/AnimationPlayer.play("move_loop")
	if Global.bars[6]==0 :
		$Platform/AnimationPlayer.pause()
	else : 
		$Platform/AnimationPlayer.play("move_loop")
	if Global.bars[7]==0 :
		$Platform/AnimationPlayer.pause()
	else : 
		$Platform/AnimationPlayer.play("move_loop")
