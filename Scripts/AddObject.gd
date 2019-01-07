extends MarginContainer

var addMode = false


onready var packedMatter = preload("res://Objects/BaseMatter.tscn")

func _ready():
	hide()

func _process(delta):
	if visible:
		if addMode:
			$PanelContainer2/VBoxContainer/VBoxContainer/TextureRect2.modulate = Color($PanelContainer2/VBoxContainer/VBoxContainer/ColorSelector2/Red.ratio, $PanelContainer2/VBoxContainer/VBoxContainer/ColorSelector2/Green.ratio, $PanelContainer2/VBoxContainer/VBoxContainer/ColorSelector2/Blue.ratio)

func _on_PauseButton_toggled(button_pressed):
	if button_pressed:
		show()
		$PanelContainer2/VBoxContainer/VBoxContainer.hide()
	else:
		addMode = false
		$PanelContainer2/VBoxContainer/CheckButton.pressed = false
		hide()


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		addMode = true
		$PanelContainer2/VBoxContainer/VBoxContainer.show()
		$PanelContainer2/VBoxContainer/VBoxContainer/TextureRect2.texture = load("res://Sprites/Ball.png")
	else:
		addMode = false
		$PanelContainer2/VBoxContainer/VBoxContainer.hide()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if visible:
			if addMode:
				var addedMatter = packedMatter.instance()
				get_viewport().get_node("MainScene").add_child(addedMatter)
				addedMatter.isPaused = true
				addedMatter.Name = $PanelContainer2/VBoxContainer/VBoxContainer/Name2/NameLine.text
				addedMatter.Mass = float($PanelContainer2/VBoxContainer/VBoxContainer/Mass2/MassLine.text)
				addedMatter.Velocity = Vector2(float($PanelContainer2/VBoxContainer/VBoxContainer/Velocity2/XVelocity.text), float($PanelContainer2/VBoxContainer/VBoxContainer/Velocity2/YVelocity.text))
				addedMatter.Radius = float($PanelContainer2/VBoxContainer/VBoxContainer/Radius2/RadiusLine.text)
				addedMatter.color = Vector3(($PanelContainer2/VBoxContainer/VBoxContainer/ColorSelector2/Red).ratio, ($PanelContainer2/VBoxContainer/VBoxContainer/ColorSelector2/Green).ratio, ($PanelContainer2/VBoxContainer/VBoxContainer/ColorSelector2/Blue).ratio)
				addedMatter.global_position = addedMatter.get_global_mouse_position()
				addedMatter.internalPosition = addedMatter.get_global_mouse_position()

func _gui_input(event):
   if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
       accept_event()