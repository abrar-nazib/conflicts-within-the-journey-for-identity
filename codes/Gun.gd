extends Sprite2D

var can_fire = true
@onready var bullet: PackedScene = preload("res://Scenes/bullet.tscn")
@onready var marker = get_node("Marker")
@onready var crosshair: Sprite2D = get_node("../../Crosshair")
@onready var animated_sprite: Node2D = get_parent().get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		var gun_position = get_global_position()
		var crosshair_position = crosshair.get_global_position()
		# Set bullet's global position to the gun's global position with some offset
		bullet_instance.set_global_position(
			Vector2(
				(crosshair_position.x - gun_position.x) / 3,
				(crosshair_position.y - gun_position.y) / 3
			)
		)

		animated_sprite.add_child(bullet_instance)
		can_fire = false
		$FireControlTimer.start()


func _on_fire_control_timer_timeout():
	can_fire = true
	$FireControlTimer.stop()
