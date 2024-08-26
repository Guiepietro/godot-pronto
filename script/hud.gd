extends CanvasLayer

signal start_game
@onready var scorelabel = $Control/scorelabel
@onready var messagelabel = $Control/messagelabel
@onready var message_timer = $messageTimer
@onready var start_button = $Control/startButton


func show_message(text):
	messagelabel.text = text
	messagelabel.show()
	message_timer.start()
	
	
func show_game_over():
	show_message("Game Over")
	await message_timer.timeout
	
	messagelabel.text = "vitinho e     gui g."
	messagelabel.show()
	
	await get_tree().create_timer(1.0).timeout
	start_button.show()
	
	
func update_score(score):
	scorelabel.text = str(score)

func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()
	
func _on_message_timer_timeout():
	messagelabel.hide()
