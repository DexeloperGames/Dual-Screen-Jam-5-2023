extends Node3D
class_name GoalZone

# Called when the node enters the scene tree for the first time.
func _ready():
#	await tree_entered
	await get_tree().physics_frame
	
	get_tree().call_group("Goal Recievers", "recieve_goal", self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_area_entered(area):
	print(area)
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	print(body)
	if body is SimpleCar:
		print("yay car win 1")
		get_tree().call_group("Player Score Recievers", "recieve_player_goal")
		queue_free()
	pass # Replace with function body.
