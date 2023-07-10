extends CharacterBody2D

@export var speed: float = 50.0
@export var jump_velocity = -400.0
@export var double_jump_velocity = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hand: Sprite2D = animated_sprite.get_node("Hand")
@onready var gun: Sprite2D = hand.get_node("Gun")
@onready var crossHair: Sprite2D = animated_sprite.get_node("Crosshair")
@onready var health_bar:ProgressBar = $HealthBar
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var double_jumped: bool = false
var was_in_air: bool = false
var animation_locked: bool = false
var direction: Vector2 = Vector2.ZERO
var death_count = 0

var health: float = 75
var playerInArea: bool = false
@onready var player: CharacterBody2D = get_node("../Player")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
	else:
		double_jumped = false
		if was_in_air:
			land()

		was_in_air = false


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	direction = Input.get_vector("left", "right", "up", "down")
	
	if(playerInArea):
		if(player.global_position.x < global_position.x):
				direction = Vector2.LEFT
		else:
				direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO 
	if direction.x != 0:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	

	
	move_and_slide()
	update_animation()
	update_facing_direction()
	update_health_bar()


func update_animation():
	if not animation_locked:
		if not is_on_floor():
			animated_sprite.play("jump_loop")
		else:
			if direction.x != 0:
				animated_sprite.play("run")
			else:
				animated_sprite.play("idle")


func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
		hand.flip_h = false
		gun.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		hand.flip_h = true
		gun.flip_h = true
	update_hand_facing_direction()


func update_hand_facing_direction():
	# Do the positioning of the hand here.
	if animated_sprite.animation == "idle":
		hand.position.y = 2
		hand.offset.y = 2
		if not hand.flip_h:
			hand.offset.x = 12
			hand.position.x = -14
		else:
			hand.offset.x = -12
			hand.position.x = 14

	elif animated_sprite.animation == "run":
		hand.position.y = 5
		hand.offset.y = 2
		if not hand.flip_h:
			hand.position.x = -10
			hand.offset.x = 12
		else:
			hand.offset.x = -12
			hand.position.x = 10

	else:
		hand.position.y = 0
		hand.offset.y = 2
		if not hand.flip_h:
			hand.offset.x = 12
			hand.position.x = -11
		else:
			hand.offset.x = -12
			hand.position.x = 11
	update_gun_facing_direction()


func update_gun_facing_direction():
	if not gun.flip_h:
		gun.offset.x = 17
	else:
		gun.offset.x = -17
	update_crosshair_position()


func update_crosshair_position():
	if gun.flip_h:
		crossHair.position.x = gun.position.x - 100
	else:
		crossHair.position.x = gun.position.x + 100


func jump():
	velocity.y = jump_velocity
	animated_sprite.play("jump_start")
	animation_locked = true


func double_jump():
	velocity.y = double_jump_velocity
	animated_sprite.play("jump_double")
	animation_locked = true


func land():
	animated_sprite.play("jump_end")
	animation_locked = true


func _on_animated_sprite_2d_animation_finished():
	if ["jump_start", "jump_end", "jump_double"].has(animated_sprite.animation):
		# Whenever the animation is finished, unlock the animation.
		animation_locked = false


func _on_area_2d_area_entered(area):

	if(area.name == "PlayerArea"):
		playerInArea = true
	
func update_health_bar():
	health_bar.value = health;
	if(health <= 0):
		death_count += 1
		global_position.y -= 200
		global_position.x = player.global_position.x + 200
		if(death_count < 5):
			health = 75
		else:
			queue_free()
			get_tree().change_scene_to_file("res://scenes/last_scene.tscn")
			


func _on_detection_area_area_exited(area):

	if(area.name == "PlayerArea"):
		playerInArea = false
