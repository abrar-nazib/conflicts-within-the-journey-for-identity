extends Area2D

# Get the crosshair node
@onready var crosshair = get_node("../../Crosshair")

@export var speed = 800
var direction: Vector2 = Vector2.ZERO
var bounce_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the direction to the crosshair
	direction = crosshair.global_position - global_position

	# set_linear_velocity(direction.normalized() * speed)
	# set_gravity_scale(0)
	# set_linear_damp(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Delete the element if the velocity is less than 300
	# if get_linear_velocity().length() < 200:
	# 	print("Speed low")
	# 	queue_free()
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	# print("On Screen's edge")
	# set_linear_velocity(-direction.normalized() * speed)
	# bounce_count += 1
	# print(bounce_count)
	# if bounce_count > 1:
	# 	print("bounce count exceeded")
	# 	queue_free()
	pass


func _on_area_entered(area):
	pass  # Replace with function body.
