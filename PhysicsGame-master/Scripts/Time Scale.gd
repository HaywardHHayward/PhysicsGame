extends MarginContainer

signal pause

signal unpause



var paused = false

onready var timePassed = 0

func _ready():
	self.connect("pause", get_viewport().get_node("MainScene") , "paused")
	self.connect("unpause", get_viewport().get_node("MainScene"), "unpaused")
func _process(delta):
	if paused:
		pass
	else:
		timePassed += delta
		if timePassed < 1:
			$PanelContainer/HBoxContainer/TimePassed/Label2.text = "%d milliseconds" % int((timePassed - int(timePassed)) * 1000)
		elif timePassed > 60:
			$PanelContainer/HBoxContainer/TimePassed/Label2.text = "%d minutes, %d seconds, %d milliseconds" % [int(timePassed) / 60, int(timePassed) % 60, int((timePassed - int(timePassed)) * 1000)]
		else:
			$PanelContainer/HBoxContainer/TimePassed/Label2.text = "%d seconds, %d milliseconds" % [int(timePassed), int((timePassed - int(timePassed)) * 1000)]

func _on_PauseButton_toggled(button_pressed):
	get_tree().set_input_as_handled()
	if button_pressed:
		emit_signal("pause")
		paused = true
	else:
		emit_signal("unpause")
		paused = false

