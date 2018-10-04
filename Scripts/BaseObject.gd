extends Area2D

export(float, 299792458.0) var velocity = 0
export(float) var mass = 0

const C = 299792458.0

var is_showing = false

func _ready():
	$Overlay.hide()

func lorentz(v):
	return sqrt(1.0-(pow(v, 2)/pow(C, 2)))

func _process(delta):
	_scale(velocity)
	$Overlay/Container/VelocityContainer/Value.text = str(velocity)
	$Overlay/Container/MassContainer/Value.text = str(mass)
	velocity += C/600.0
	if is_showing:
		$Overlay.rect_position = get_global_mouse_position()-position
	

func _on_BaseObject_mouse_entered():
	$Overlay.show()
	is_showing = true

func _on_BaseObject_mouse_exited():
	$Overlay.hide()
	is_showing = false
	
func _scale(v):
	scale = Vector2(lorentz(v),1)
	$Overlay.rect_scale = Vector2(1/lorentz(v), 1)