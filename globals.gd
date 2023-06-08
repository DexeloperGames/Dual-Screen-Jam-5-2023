extends Node

@export var time : float = 0.0
@export var best : float = 0.0
@export var score : int = 0
@export var winning_score : int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save():
	var data = JSON.stringify({"best_time":time, "volume":db_to_linear(AudioServer.get_bus_volume_db(0))})
	var file = FileAccess.open("user://carboard_data.txt",FileAccess.WRITE)
	file.store_line(data)
	file.close()

func load_data():
	if not FileAccess.file_exists("user://carboard_data.txt"): return
	var file = FileAccess.open("user://carboard_data.txt",FileAccess.READ)
	var data_str = file.get_line()
	var jason = JSON.new()
	var data = jason.parse_string(data_str)
	print(data)
	best = data["best_time"]
	var volume = data["volume"]
	AudioServer.set_bus_volume_db(0,linear_to_db(volume))
#	if not parse == OK: return
#	print(data)
	
	
