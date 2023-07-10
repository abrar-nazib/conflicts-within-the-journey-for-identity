extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var gun: Sprite2D = get_node("../Hand/Gun")
	var gunPos = gun.get_global_position()
	var handPos = get_global_position()
	print("Gun Position: ")
	print(gunPos)
	print("Hand Position")
	print(handPos)
	var rot = atan((gunPos.y - handPos.y) / (gunPos.x - handPos.x)) - 1
	if rot:
		rotation = rot
