extends Camera2D

onready var cameraZoom = get_zoom()

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_zoom_in"):
		if Input.is_key_pressed(KEY_SHIFT):
			cameraZoom /= 1.1
		else:
			cameraZoom /= 1.01
	elif Input.is_action_pressed("ui_zoom_out"):
		if Input.is_key_pressed(KEY_SHIFT):
			cameraZoom *= 1.1
		else:
			cameraZoom *= 1.01
	set_zoom(cameraZoom)
	if Input.is_action_pressed("ui_up"):
		offset.y -= 5*cameraZoom.y
	elif Input.is_action_pressed("ui_down"):
		offset.y += 5*cameraZoom.y
	if Input.is_action_pressed("ui_right"):
		offset.x += 5*cameraZoom.x
	elif Input.is_action_pressed("ui_left"):
		offset.x -= 5*cameraZoom.x
