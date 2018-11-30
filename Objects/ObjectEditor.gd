extends MarginContainer

var selectedObject = null

onready var _name = $Panel/VBox/Name/NameLine

onready var velocity = [$Panel/VBox/Velocity/XVelocity, $Panel/VBox/Velocity/YVelocity]

onready var mass = $Panel/VBox/Mass/MassLine

onready var radius = $Panel/VBox/Radius/RadiusLine

func _ready():
	setObject(selectedObject)

func _process(delta):
	$Panel/VBox/NameLabel.text = selectedObject.Name

func setObject(object):
	selectedObject = object
	$Panel/VBox/TextureRect.texture = object.get_child(0).texture
	_name.text = object.Name
	velocity[0].text = str(object.Velocity.x)
	velocity[1].text = str(object.Velocity.y)
	mass.text = str(object.Mass)
	radius.text = str(object.Radius)



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

