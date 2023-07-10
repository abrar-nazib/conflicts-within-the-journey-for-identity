extends Area2D

var inside : bool =false
@onready var commentry := get_node("Signals23")
@export var idd : int 
func _ready():
	$Button.hide()
	commentry.visible=false


func _on_body_entered(body):
	$Button.show()
	inside=true
	


func _on_body_exited(body):
	$Button.hide()
	inside=false
	commentry.visible=false

func _process(delta):
	if inside :
		if Input.is_action_pressed("Interact") :
			Global.bars[idd]=1
			commentry.visible=true
#			print("Button pressed")
