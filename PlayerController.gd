extends Sprite

export var player_index = "1"

func _ready():
	Serial.connect("sobe", self, "_on_sobe")
	Serial.connect("desce", self, "_on_desce")
	Serial.connect("potenciometro", self, "_on_potenciometro")

func _on_sobe(player):
	#print("Sobe "+player)
	if player == player_index:
		position.y+=20
	
func _on_desce(player):
	#print("Desce "+player)
	if player == player_index:
		position.y-=20

func _on_potenciometro(player, value):
	#print("Potenciometro "+player+" -> "+ value)
	if player == player_index:
		position.x+=int(value)
