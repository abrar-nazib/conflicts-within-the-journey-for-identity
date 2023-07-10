extends Node2D


# Called when the node enters the scene tree for the first time.
@export var id : int= 0
var animate

func _ready():
	animate=$bar/AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.bars[5]==0 :
		animate.stop()
	else : animate.play("up")
