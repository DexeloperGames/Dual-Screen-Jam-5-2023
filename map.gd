extends Control

@export var map_pos_control : Control
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func recieve_player_position(pos):
	var remaped_pos = Vector2(pos.x,-pos.z)/1000.0+Vector2.ONE*0.5
	map_pos_control.anchor_bottom = remaped_pos.y
	map_pos_control.anchor_top = remaped_pos.y
	
	map_pos_control.anchor_right = remaped_pos.x
	map_pos_control.anchor_left = remaped_pos.x
	
	pass
