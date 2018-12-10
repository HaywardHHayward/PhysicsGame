extends MarginContainer

var selectedObject = null

onready var _name = $Panel/VBox/Name/NameLine

onready var velocity = [$Panel/VBox/Velocity/XVelocity, $Panel/VBox/Velocity/YVelocity]

onready var mass = $Panel/VBox/Mass/MassLine

onready var radius = $Panel/VBox/Radius/RadiusLine

onready var groupNodes = get_tree().get_nodes_in_group("Matter")

func _ready():
	for node in groupNodes:
		$Panel/VBox/DistanceToBox/ObjectSelector/OptionButton.add_item(node.Name)
	hide()

func _process(delta):
	if visible:
		groupNodes = get_tree().get_nodes_in_group("Matter")
		var numberThingy = $Panel/VBox/DistanceToBox/ObjectSelector/OptionButton.get_item_count()
		while len(groupNodes) > numberThingy:
			$Panel/VBox/DistanceToBox/ObjectSelector/OptionButton.add_item(groupNodes[numberThingy].Name)
			numberThingy += 1
		for number in len(groupNodes):
			$Panel/VBox/DistanceToBox/ObjectSelector/OptionButton.set_item_text(number, groupNodes[number].Name)
		$Panel/VBox/DistanceToBox/Label.text = "%f meters" % (selectedObject.internalPosition.distance_to(groupNodes[$Panel/VBox/DistanceToBox/ObjectSelector/OptionButton.selected].internalPosition)/64.0)
		selectedObject.color = Vector3(($Panel/VBox/ColorSelector/Red).ratio, ($Panel/VBox/ColorSelector/Green).ratio, ($Panel/VBox/ColorSelector/Blue).ratio)
		if $Panel/VBox/ChangeMode/CheckButton.pressed:
			pass
		else:
			$Panel/VBox/NameLabel.text = selectedObject.Name
			$Panel/VBox/TextureRect.texture = selectedObject.get_child(0).texture
			$Panel/VBox/TextureRect.modulate = selectedObject.get_child(0).modulate
			_name.text = selectedObject.Name
			velocity[0].text = str(selectedObject.Velocity.x)
			velocity[1].text = str(selectedObject.Velocity.y)
			if selectedObject.Mass >= 1:
				mass.text = str(selectedObject.Mass)
				$Panel/VBox/Mass/Label2.text = "kilograms"
			else:
				mass.text = str(selectedObject.Mass * 1000)
				$Panel/VBox/Mass/Label2.text = "grams"
			radius.text = str(selectedObject.Radius)
			if selectedObject.Velocity.length() < 1000:
				$Panel/VBox/Speed/Speed.text = str(selectedObject.Velocity.length())
				$Panel/VBox/Speed/MPS.text = "m/s"
			else:
				$Panel/VBox/Speed/Speed.text = str(selectedObject.Velocity.length()/1000.0)
				$Panel/VBox/Speed/MPS.text = "km/s"
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
	$Panel/VBox/ColorSelector/Red.value = selectedObject.color.x * 255
	$Panel/VBox/ColorSelector/Green.value = selectedObject.color.y * 255
	$Panel/VBox/ColorSelector/Blue.value = selectedObject.color.z * 255



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