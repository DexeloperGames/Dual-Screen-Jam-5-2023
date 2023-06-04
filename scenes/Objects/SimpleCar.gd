extends CharacterBody3D


@export var SPEED : float = 0
@export var ACCELERATION : float = 30
@export var DECCELERATION : float = 1
@export var JUMP_VELOCITY : float = 4.5
@export var TURN_SPEED : float = 6

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y -= gravity * delta

	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forwards", "backwards")
	var direction = (transform.basis * Vector3(0, 0, 1)).normalized()
	if input_dir:
#		velocity.x = direction.x * SPEED
		SPEED += ACCELERATION*delta*-input_dir.y
		if is_on_wall():
			SPEED = min(SPEED,10)
	else:
#		velocity.x = move_toward(velocity.x, 0, DECCELERATION)
#		velocity.z = move_toward(velocity.z, 0, DECCELERATION)
		SPEED = lerp(SPEED, 0.0, DECCELERATION*delta)
	velocity.x = -direction.x*SPEED
	velocity.z = -direction.z*SPEED
#	DECCELERATION = remap(SPEED, 0, 100, 0.1, 10)
	rotation_degrees.y += -input_dir.x*(velocity.length() if input_dir.y != 0.0 else 10.0)*TURN_SPEED*delta
	move_and_slide()
	$Control/Label.text = "%3.4f MPH"%(velocity.length()*2.23694)
#	$Control/Label.text += "\n%3.4f SPEED"%(SPEED)
	$Control/Label.text += "\n%s"%global_position
	get_tree().call_group("Player Transform Recievers", "recieve_player_transform", global_transform)
