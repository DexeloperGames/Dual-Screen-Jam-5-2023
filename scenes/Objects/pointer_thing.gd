extends Node3D

@export var point_to : Vector3 = Vector3.FORWARD
# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.connect("frame_pre_draw", _on_frame_draw_pre)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_frame_draw_pre():
	look_at(point_to)
	pass

func recieve_goal(goal : GoalZone):
	point_to = Vector3(goal.global_position.x,global_position.y,goal.global_position.z)
