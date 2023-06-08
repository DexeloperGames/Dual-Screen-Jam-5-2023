extends Control

@export_multiline var winning_format_text : String
@export_multiline var beat_dev_format_text : String
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Label.text = winning_format_text%[Globals.score,Globals.winning_score,floori(Globals.time/60.0),fmod(Globals.time,60.0)]
	if Globals.time <= 60+14.446:
		$VBoxContainer/Label.text = beat_dev_format_text%[floori(Globals.time/60.0),fmod(Globals.time,60.0)]
	if (Globals.time < Globals.best or Globals.best == 0.0) and Globals.time!=0.0:
		Globals.best = Globals.time
		$VBoxContainer/Label.text += "\n\nNew Best Time!!!"
	Globals.save()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().call_group("DS Display Manager", "switch_to_main_level")
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().call_group("DS Display Manager", "switch_to_title")
	pass # Replace with function body.
