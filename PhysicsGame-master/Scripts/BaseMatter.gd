extends Area2D

const G = 6.67408e-11
const c = 299792458

var treeNode = null

var groupNodes = null

var internalPosition = null

signal clicked

signal newObject

var isPaused = false

func _ready():
	emit_signal("newObject", self)

export(String) var Name = "Object"

export(Vector2) var Velocity = Vector2(0,0)

export(float, 0, 1e55) var Mass = 1

export(float, 0, 1e50) var Radius = 0.25#Cosmetic, doesn't change the physics

const PIXELSPERMETER = 64.0 #For every meter, there are 64.0 pixels

const METERSPERPIXEL = 1/PIXELSPERMETER #For every pixel, there are 1/64 meters

var isMouseIn = false

var energy = 0

onready var color = Vector3($Sprite.modulate.r, $Sprite.modulate.g, $Sprite.modulate.b)

func gravitation(object):
	var force = G * ((Mass * object.Mass) / pow(distance(object),2))
	return force

func acceleration(force):
	var acceleration = force / Mass
	return acceleration

func kineticEnergy(object):
	return (1/2)*object.Mass*pow(object.Velocity.length(), 2)

func relativePosition(object):
	return to_local(object.internalPosition)

func distance(object):
	return internalPosition.distance_to(object.internalPosition)*METERSPERPIXEL

func move():
	for objectNode in groupNodes:
			if objectNode != self:
				var unitVector = relativePosition(objectNode).normalized()
				Velocity += unitVector * acceleration(gravitation(objectNode))/60.0
	internalPosition += Velocity*PIXELSPERMETER/60.0
	global_position = internalPosition

func _physics_process(delta):
	energy = sqrt(pow(Mass, 2)*(pow(c,4)) + pow(Velocity.length()*Mass, 2)*pow(Mass, 2))
	groupNodes = treeNode.get_nodes_in_group("Matter")
	if isPaused == false:
		move()
	$Sprite.modulate = Color(color.x, color.y, color.z)
	if Input.is_action_just_pressed("mouse_m1") and isMouseIn:
		emit_signal("clicked", self)
		get_tree().set_input_as_handled()
	scale = Vector2(Radius, Radius) * 4

func _on_BaseMatter_mouse_entered():
	isMouseIn = true

func _on_BaseMatter_mouse_exited():
	isMouseIn = false

func paused():
	isPaused = true

func unpaused():
	isPaused = false


func _on_BaseMatter_newObject(object):
	self.connect("clicked", get_parent(), "_clicked")
	self.connect("newObject", get_parent(), "newObject")
	scale = Vector2(Radius, Radius) * 4
	treeNode = get_tree()
	groupNodes = treeNode.get_nodes_in_group("Matter")
	internalPosition = get_position()


func _on_BaseMatter_area_entered(area):
	if energy > area.energy:
		Mass += area.Mass
		Velocity = Vector2(((Mass*Velocity.x)+(area.Mass*area.Velocity.x))/(Mass+area.Mass),((Mass*Velocity.y)+(area.Mass*area.Velocity.y))/(Mass+area.Mass))
		Radius = pow(pow(Radius,3) + pow(area.Radius,3), 1/3.0)
		if get_parent().get_node("Camera2D/GUI/ObjectViewer").selectedObject == area:
			get_parent().get_node("Camera2D/GUI/ObjectViewer").setObject(self)
		for option in get_parent().get_node("Camera2D/GUI/ObjectViewer/Panel/VBox/DistanceToBox/ObjectSelector/OptionButton").get_item_count():
			if get_parent().get_node("Camera2D/GUI/ObjectViewer/Panel/VBox/DistanceToBox/ObjectSelector/OptionButton").get_item_text(option) == area.Name:
				get_parent().get_node("Camera2D/GUI/ObjectViewer/Panel/VBox/DistanceToBox/ObjectSelector/OptionButton").remove_item(option)
				break
		area.queue_free()
	elif energy == area.energy:
		if get_instance_id() > area.get_instance_id():
			Mass += area.Mass
			Velocity = Vector2(((Mass*Velocity.x)+(area.Mass*area.Velocity.x))/(Mass+area.Mass),((Mass*Velocity.y)+(area.Mass*area.Velocity.y))/(Mass+area.Mass))
			Radius = pow(pow(Radius,3) + pow(area.Radius,3), 1/3.0)
			if get_parent().get_node("Camera2D/GUI/ObjectViewer").selectedObject == area:
				get_parent().get_node("Camera2D/GUI/ObjectViewer").setObject(self)
			area.queue_free()