extends Control

#@export var title_screen = preload("res://scenes/UI/title_screen.tscn")
#@export var settings_menu = preload("res://scenes/UI/settings_menu.tscn")
#@export var opening_cutscene = preload("res://scenes/cutscene_display.tscn")
#
#@export var text_cutscene = preload("res://scenes/dialoug_or_whatever.tscn")
#@export var gameplay = preload("res://scenes/objects/playfield.tscn")
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

#func switch_to_main_menu():
#	switch_to(title_screen)
#
#func switch_to_settings():
#	switch_to(settings_menu)
#
#func switch_to_opening():
#	switch_to(opening_cutscene)
#
#func switch_to_text_cutscene():
#	switch_to(text_cutscene)
#
#func switch_to_gameplay():
#	switch_to(gameplay)
