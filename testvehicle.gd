extends VehicleBody3D

@export var EngineSpeed = 1000.0
@export var BrakeForce = 1000.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action("forwards"):
		engine_force = EngineSpeed*float(event.is_pressed())
	if event.is_action("backwards"):
		brake = BrakeForce*float(event.is_pressed())
	var turn = Input.get_axis("right", "left")
	steering = turn
	pass

func _physics_process(delta):
	var grav_dir = -global_transform.basis.y
	
#	Note: This property is only read when the project starts. To change the default gravity vector at runtime, use the following code sample:
	
	# Set the default gravity direction to `Vector3(0, -1, 0)`.
	PhysicsServer3D.area_set_param(get_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR, grav_dir)
	$Control/Label.text = "%3.4f MPH"%(linear_velocity.length()*2.23694)
#	PhysicsServer3D.area_set_param()
