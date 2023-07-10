extends Sprite2D
@onready var player = get_node("../../../Player")
@onready var mob = get_node("../../../Mob")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
# Set the global position of the node to the mouse position
	if(mob.playerInArea):
		set_global_position(player.get_global_position())
	
