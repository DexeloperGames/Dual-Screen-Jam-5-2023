extends Control

@export var top_screen : Control
@export var bottom_screen : Control

@export var screen_viewport : SubViewport

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _gui_input(event):
#	print("EVENT")
	pass


func _on_top_screen_gui_input(event):
#	print("TOP SCREEN EVENT")
	if event is InputEventMouse:
		var new_input_pos = round(event.position/top_screen.size*Vector2(256,192))
		event.position = new_input_pos
		screen_viewport.push_input(event)
		pass
	pass # Replace with function body.


func _on_bottom_screen_gui_input(event):
	if event is InputEventMouse:
		var new_input_pos = round(event.position/top_screen.size*Vector2(256,192)+Vector2(0,192))
		event.position = new_input_pos
		screen_viewport.push_input(event)
	pass # Replace with function body.
