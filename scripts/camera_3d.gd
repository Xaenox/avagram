extends Camera3D

#@export var player:  = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if event.is_action_pressed("move_to_click"):
		if event is InputEventMouseButton and event.pressed:
			var space_state = get_world_3d().direct_space_state
			var mouse_pos = event.position
			var from = project_ray_origin(mouse_pos)
			var to = from + project_ray_normal(mouse_pos) * 2000
			var arguments = PhysicsRayQueryParameters3D.create(from, to)
			var rayArray = space_state.intersect_ray(arguments)
			if rayArray.has("position"):
				%Player.target = rayArray["position"]
			
		print("my_action occurred!")
		
