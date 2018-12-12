extends Camera2D

onready var cameraZoom = get_zoom()

func _process(delta):
	if Input.is_action_pressed("ui_zoom_in"):
		if Input.is_key_pressed(KEY_SHIFT):
			cameraZoom /= 1.1
		elif Input.is_key_pressed(KEY_CONTROL):
			cameraZoom /= 1.001
		else:
			cameraZoom /= 1.01
	elif Input.is_action_pressed("ui_zoom_out"):
		if Input.is_key_pressed(KEY_SHIFT):
			cameraZoom *= 1.1
		elif Input.is_key_pressed(KEY_CONTROL):
			cameraZoom *= 1.001
		else:
			cameraZoom *= 1.01
	set_zoom(cameraZoom)
	if Input.is_action_pressed("ui_up"):
		if Input.is_key_pressed(KEY_SHIFT):
			position.y -= 50*cameraZoom.y
		elif Input.is_key_pressed(KEY_CONTROL):
			position.y -= cameraZoom.y
		else:
			position.y -= 5*cameraZoom.y
	elif Input.is_action_pressed("ui_down"):
		if Input.is_key_pressed(KEY_SHIFT):
			position.y += 50*cameraZoom.y
		elif Input.is_key_pressed(KEY_CONTROL):
			position.y += cameraZoom.y
		else:
			position.y += 5*cameraZoom.y
	if Input.is_action_pressed("ui_right"):
		if Input.is_key_pressed(KEY_SHIFT):
			position.x += 50*cameraZoom.x
		elif Input.is_key_pressed(KEY_CONTROL):
			position.x += cameraZoom.x
		else:
			position.x += 5*cameraZoom.x
	elif Input.is_action_pressed("ui_left"):
		if Input.is_key_pressed(KEY_SHIFT):
			position.x -= 50*cameraZoom.x
		elif Input.is_key_pressed(KEY_CONTROL):
			position.x -= cameraZoom.x
		else:
			position.x -= 5*cameraZoom.x
