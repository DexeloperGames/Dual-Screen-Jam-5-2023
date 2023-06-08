extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/SubViewportContainer/SubViewport/Node3D/Marker3D/Camera3D/AnimationPlayer.play("coolspin")
	$"VBoxContainer/Control/TabContainer/Menu/VBoxContainer/Best Time Label".text = "Best Time: %d:%06.3f"%[floori(Globals.best/60),fmod(Globals.best,60.0)]
	$VBoxContainer/Control/TabContainer/Options/VBoxContainer/HSlider.value = 100.0*db_to_linear(AudioServer.get_bus_volume_db(0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().call_group("DS Display Manager", "switch_to_main_level")
	pass # Replace with function body.


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value/100.0))
	pass # Replace with function body.
