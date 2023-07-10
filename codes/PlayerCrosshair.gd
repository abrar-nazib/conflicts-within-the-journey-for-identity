extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
  pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
  # Set the global y position of the node to the position of the mose usinge get_global_mouse_position()
  var mouse_pos = get_global_mouse_position()
  # Get global position of the node
  var pos = get_global_position()
  # Set the global position of the node to the mouse position
  set_global_position(Vector2(pos.x, mouse_pos.y))
