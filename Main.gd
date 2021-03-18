extends Node2D

var Player1Score = 0
var Player2Score = 0

func _process(delta):
	$"Player1 Score".text = str(Player1Score)
	$"Player2 Score".text = str(Player2Score)
	
func _on_SideWallLeft_body_entered(body):
	
	$Ball.position = Vector2(320,240)
	Player2Score += 1
	$Ball.velocity.x = -150
	$Ball.velocity.y = 50
	


func _on_SideWallRight_body_entered(body):
	
	
	$Ball.position = Vector2(320,240)
	Player1Score += 1
	$Ball.velocity.x = -150
	$Ball.velocity.y = 50


