extends MarginContainer

var addMode = false


onready var packedMatter = preload("res://Objects/BaseMatter.tscn")

func _ready():
	hide()

func _process(delta):
	pass

func _on_PauseButton_toggled(button_pressed):
	if button_pressed:
		show()
	else:
		addMode = false
		$PanelContainer2/VBoxContainer/CheckButton.pressed = false
		hide()


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		addMode = true
	else:
		addMode = false

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if visible:
			if addMode:
				var addedMatter = packedMatter.instance()
				get_viewport().get_node("MainScene").add_child(addedMatter)
				addedMatter.isPaused = true
				addedMatter.Name = "Object"
				addedMatter.Mass = 1
				addedMatter.Velocity = Vector2(0,0)
				addedMatter.Radius = 0.25
				addedMatter.global_position = get_viewport().get_node("MainScene/BaseLayer").get_global_mouse_position() 
				addedMatter.internalPosition = get_viewport().get_node("MainScene/BaseLayer").get_global_mouse_position()


func _gui_input(event):
   if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
       accept_event()