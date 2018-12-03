extends MarginContainer

var selectedObject = null

onready var _name = $Panel/VBox/Name/NameLine

onready var velocity = [$Panel/VBox/Velocity/XVelocity, $Panel/VBox/Velocity/YVelocity]

onready var mass = $Panel/VBox/Mass/MassLine

onready var radius = $Panel/VBox/Radius/RadiusLine

func _ready():
	hide()

func _process(delta):
	if visible:
		if $Panel/VBox/ChangeMode/CheckButton.pressed:
			pass
		else:
			$Panel/VBox/NameLabel.text = selectedObject.Name
			$Panel/VBox/TextureRect.texture = selectedObject.get_child(0).texture
			_name.text = selectedObject.Name
			velocity[0].text = str(selectedObject.Velocity.x)
			velocity[1].text = str(selectedObject.Velocity.y)
			mass.text = str(selectedObject.Mass)
			radius.text = str(selectedObject.Radius)
		if Input.is_action_just_pressed("ui_cancel"):
			hide()

func setObject(object):
	selectedObject = object
	$Panel/VBox/TextureRect.texture = selectedObject.get_child(0).texture
	_name.text = selectedObject.Name
	velocity[0].text = str(selectedObject.Velocity.x)
	velocity[1].text = str(selectedObject.Velocity.y)
	mass.text = str(selectedObject.Mass)
	radius.text = str(selectedObject.Radius)



func _on_RadiusLine_text_entered(new_text):
	selectedObject.Radius = float(new_text)


func _on_MassLine_text_entered(new_text):
	selectedObject.Mass = float(new_text)


func _on_YVelocity_text_entered(new_text):
	selectedObject.Velocity.y = float(new_text)


func _on_XVelocity_text_entered(new_text):
	selectedObject.Velocity.x = float(new_text)


func _on_NameLine_text_entered(new_text):
	selectedObject.Name = new_text

func _clicked(selectObject):
	show()
	setObject(selectObject)
