extends MarginContainer

var addMode = false

var mouseIn = false

onready var packedMatter = preload("res://Objects/BaseMatter.tscn")

func _ready():
	hide()

func _process(delta):
	if visible:
		if mouseIn == false and addMode == true:
			if Input.is_action_just_pressed("mouse_m1"):
				var addedMatter = packedMatter.instance()
				get_viewport().get_node("MainScene").add_child(addedMatter)
				addedMatter.isPaused = true
				addedMatter.Name = "Object"
				addedMatter.Mass = 1
				addedMatter.Velocity = Vector2(0,0)
				addedMatter.Radius = 0.25
				addedMatter.global_position = get_global_mouse_position()
				addedMatter.internalPosition = get_global_mouse_position()

func _on_PauseButton_toggled(button_pressed):
	if button_pressed:
		show()
	else:
		addMode = false
		hide()


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		addMode = true
	else:
		addMode = false

