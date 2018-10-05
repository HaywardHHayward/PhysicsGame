extends Area2D

export(float, 299792458.0) var velocity = 0
export(float) var mass = 0
export(float, 299792458.0) var acceleration = 0

const C = 299792458.0

onready var baseMass = mass

var is_showing = false

func _ready():
	$Overlay.hide()

func lorentz_factor(v):
	return sqrt(1.0-(pow(v, 2)/pow(C, 2)))

func _physics_process(delta):
	lorentz_transformation(velocity)
	$Overlay/Container/VelocityContainer/Value.text = str(velocity)
	$Overlay/Container/MassContainer/Value.text = str(mass)
	$Overlay/Container/AccelerationContainer/Value.text = str(acceleration)
	if is_showing:
		$Overlay.rect_position = get_global_mouse_position()-position
	velocity += acceleration/60.0

func _on_BaseObject_mouse_entered():
	$Overlay.show()
	is_showing = true

func _on_BaseObject_mouse_exited():
	$Overlay.hide()
	is_showing = false
	
func lorentz_transformation(v):
	scale = Vector2(lorentz_factor(v),1)
	$Overlay.rect_scale = Vector2(1/lorentz_factor(v), 1)
	mass = baseMass/lorentz_factor(v)
