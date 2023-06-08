extends Control

@export var main_level : PackedScene = preload("res://scenes/Objects/car_view_thing.tscn")
@export var win_screen : PackedScene = preload("res://scenes/UI/win_screen.tscn")
@export var title_screen : PackedScene = preload("res://scenes/UI/title_screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clear():
	for child in get_children():
		child.queue_free()

func switch_to(scene : PackedScene):
	clear()
	var new_screen = scene.instantiate()
	add_child(new_screen)

func switch_to_main_level():
	switch_to(main_level)

func switch_to_win_screen():
	switch_to(win_screen)

func switch_to_title():
	switch_to(title_screen)
