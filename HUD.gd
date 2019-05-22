extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the\nCreeps!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()	

func _on_MessageTimer_timeout():
	$MessageLabel.hide()


func _on_Button_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	
func update_score(score):
    $ScoreLabel.text = str(score)		
