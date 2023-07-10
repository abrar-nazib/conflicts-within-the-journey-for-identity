extends Sprite2D

# Ge the crosshair node
@onready var crosshair = get_node("../Crosshair")
# Get the hand node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Get crosshair position
	var crosshair_pos = crosshair.get_global_position()
	# Get hand position
	var hand_pos = get_global_position()

	var rot = atan2(crosshair_pos.y - hand_pos.y, crosshair_pos.x - hand_pos.x)
	if not flip_h:
		rotation = rot
	else:
		rotation = rot + PI
