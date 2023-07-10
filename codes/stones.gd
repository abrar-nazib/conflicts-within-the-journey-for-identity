extends Area2D


@export var stoneid : int 




func _on_body_entered(body):
	Global.stones_collected+=1
	Global.stones_array[stoneid]=0
	$stonesound.play()
#	print("On body entered")
#	print(stoneid)
	hide()


func _on_stonesound_finished():
	queue_free()
