extends Control

@export var map_pos_control : Control
@export var goal_pos_control : Control
var points : PackedVector2Array
#var points_3d : PackedVector3Array
# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.connect("frame_pre_draw",_on_frame_draw_pre)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
var counts = 0
func recieve_player_transform(transform : Transform3D):
	var pos = transform.origin
	var rot = PI-atan2(-transform.basis.x.z,transform.basis.x.x)
	var remaped_pos = Vector2(pos.z,-pos.x)/1000.0+Vector2.ONE*0.5
	map_pos_control.anchor_bottom = remaped_pos.y
	map_pos_control.anchor_top = remaped_pos.y
	
	map_pos_control.anchor_right = remaped_pos.x
	map_pos_control.anchor_left = remaped_pos.x
	
#	var debug_line_thingy : Node2D= $"AspectRatioContainer/Control/Center/Debug Line Thingy"
	
#	points.append(debug_line_thingy.global_transform.affine_inverse()*map_pos_control.global_position)
#	if counts%100 == 0:
#		queue_redraw()
#	counts += 1
#	debug_line_thingy.points = points
	$"AspectRatioContainer/Control/Map Position/Car Symbol".rotation = rot
	pass

func _on_frame_draw_pre():
	var control_rect : Rect2i = $AspectRatioContainer/Control.get_global_rect()
	var road_mesh : MeshInstance2D = $"AspectRatioContainer/Control/Center/Map Meshes/MeshInstance2D"
	var view_rect = road_mesh.get_viewport_rect()
	var new_scale = min(control_rect.size.y/view_rect.size.y,control_rect.size.x/view_rect.size.x)
#	print(control_rect)
	var map_meshes : Node2D = $"AspectRatioContainer/Control/Center/Map Meshes"
	map_meshes.transform.x = Vector2(0,-control_rect.size.x/1000.0)
	map_meshes.transform.y = Vector2(-control_rect.size.y/1000.0,0)
	
	pass

func recieve_goal(goal : GoalZone):
	var pos = goal.global_position
	var remaped_pos = Vector2(pos.z,-pos.x)/1000.0+Vector2.ONE*0.5
	goal_pos_control.anchor_bottom = remaped_pos.y
	goal_pos_control.anchor_top = remaped_pos.y
	
	goal_pos_control.anchor_right = remaped_pos.x
	goal_pos_control.anchor_left = remaped_pos.x

func debug_draw_points(debug_points : PackedVector2Array):
	$"AspectRatioContainer/Control/Center/Map Meshes/MeshInstance2D/Weird debug thing".points = debug_points
#	points = debug_points
#	queue_redraw()

func _draw():
#	print(points.size())
#	draw_polyline(points, Color.WHITE, 20)
	if points.is_empty(): return
	for dot in points:
		draw_circle(dot,3,Color.RED)
#	if points.size() > 1:
#		draw_polyline(points,Color.RED,6)
