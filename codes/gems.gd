extends Area2D


func _ready():
	$AnimatedSprite2D.play("coin")

func _on_body_entered(body):
	Global.gems_collected += 1
	$coineffect.play()
	hide()



func _on_coineffect_finished():
	queue_free()
