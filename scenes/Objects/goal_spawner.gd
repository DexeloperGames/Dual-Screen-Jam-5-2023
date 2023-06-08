extends Node3D


@export var goal_feild : NavigationRegion3D
@export var goal_zone : PackedScene = preload("res://scenes/Objects/goal_zone.tscn")
@export var goal_position_array : PackedVector3Array
var map
# Called when the node enters the scene tree for the first time.
func _ready():
#	await get_tree().physics_frame
#	send_debug_draw()
	pass # Replace with function body.

func send_debug_draw():
	var points : PackedVector2Array
	points.resize(goal_position_array.size())
	for i in range(goal_position_array.size()):
		points[i] = Vector2(goal_position_array[i].x,goal_position_array[i].z)
		get_tree().call_group("The Map", "debug_draw_points", points)


func spawn_new_goal():
	
#	var map : RID = goal_feild.get_region_rid()
#	print(map)
#	var random_pos = Vector3(randf_range(-1000,1000),0,randf_range(-1000,1000))
#	var new_pos = NavigationServer3D.map_get_closest_point(map, random_pos)
	var new_pos = goal_position_array[randi_range(0,goal_position_array.size())]
	print(new_pos)
	var new_goal : Node3D = goal_zone.instantiate()
	add_child(new_goal)
	new_goal.global_position = new_pos
	
	pass

func recieve_player_goal():
	spawn_new_goal()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
