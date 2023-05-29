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
