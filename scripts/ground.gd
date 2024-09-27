extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	#print(" event")
	#if event is InputEventMouseButton and event.pressed:
		#$Player.target = click_position
		#print("click_position event")
#
#func _input(event):
	#print("Left button was clicked at ")
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#print("Left button was clicked at ", event.position)
			#$Player.target = event.position
		#if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			#print("Wheel up")
