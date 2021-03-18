extends Node

const serial_res = preload("res://bin/gdserial.gdns")
onready var serial_port = serial_res.new()

var is_port_open = false
var text = ""

signal sobe(player)
signal desce(player)
signal potenciometro(player,value)

func _ready():
	open()

func _exit_tree():
	close()

func open():
	is_port_open = serial_port.open_port("COM3", 9600)
	print(is_port_open)

func close():
	is_port_open = false
	print(is_port_open)
	serial_port.close_port()

func _process(delta):
	if is_port_open:
		var t = serial_port.read_text()
		if t.length() > 0:
			for c in t:
				if c == "\n":
					print(text)
					on_text_received(text)
					text = ""
				else:
					text+=c
func on_text_received(text):
	var command_array = text.split(" ", true)
	#print(command_array)
	if command_array.size() < 2:
		return
	if str(command_array[1]) == "Sobe":
		emit_signal("sobe", command_array[0])
	elif command_array[1] == "Desce":
		emit_signal("desce",command_array[0])
	else:
		emit_signal("potenciometro",command_array[0],command_array[1])
