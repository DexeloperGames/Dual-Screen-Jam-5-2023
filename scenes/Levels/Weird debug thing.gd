extends Node2D

var points : PackedVector2Array
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func debug_draw_points(debug_points : PackedVector2Array):
	points = debug_points
	queue_redraw()

func _draw():
#	print(points.size())
#	draw_polyline(points, Color.WHITE, 20)
	if points.is_empty(): return
	for dot in points:
		draw_circle(dot,10,Color.RED)
#	if points.size() > 1:
#		draw_polyline(points,Color.RED,6)
