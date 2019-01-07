extends MarginContainer

signal pause

signal unpause

signal timeScaleChanged

var paused = false

onready var timePassed = 0

func _ready():
	self.connect("pause", get_viewport().get_node("MainScene") , "paused")
	self.connect("unpause", get_viewport().get_node("MainScene"), "unpaused")
	self.connect("timeScaleChanged", get_viewport().get_node("MainScene"), "timeScaleChanged")
func _process(delta):
	if paused:
		pass
	else:
		timePassed += delta * float($PanelContainer/HBoxContainer/TimeScale.value)
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



func _on_TimeScale_value_changed(value):
	get_tree().set_input_as_handled()
	emit_signal("timeScaleChanged", float(value))
