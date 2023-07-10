extends Area2D

@export var speed = 5
@onready var hand: Sprite2D = get_node("../Hand")
@onready var crosshair: Sprite2D = get_node("../Crosshair")
var crosshair_position: Vector2 = Vector2.ZERO
var hand_position: Vector2 = Vector2.ZERO
var initial_position = Vector2.ZERO
var bounced: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set to top level
	# Get cursor global position
	crosshair_position = crosshair.get_global_position()
	# Get hand global position
	hand_position = hand.get_global_position()
	# Get initial position
	initial_position = get_global_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# increment to cursor_position
	if bounced:
		global_position -= (crosshair_position - hand_position).normalized() * speed
	else:
		global_position += (crosshair_position - hand_position).normalized() * speed


func _physics_process(_delta):
	set_physics_process(false)


func _on_visible_on_screen_notifier_2d_screen_exited():
	if bounced:
		queue_free()
	bounced = true


func _on_body_entered(body: Node2D):
	print(body.name)
	if(body.name == "Mob"):
		body.health -= 5
	if(body.name == "Player"):
		body.health -= 3
	queue_free()
