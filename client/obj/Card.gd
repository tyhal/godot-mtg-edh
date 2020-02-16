extends RigidBody2D

signal clicked

var held = false
var tapped = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("clicked", self)
		if event.button_index == BUTTON_RIGHT and event.pressed:
			# call on the server to update the card tapped
			rpc tap(id)
			tapped = !tapped
			var r = -1
			if tapped:
				r = 1
			get_node("CollisionShape2D").rotate(deg2rad(r * 90))

func setColor(color):
	get_node("CollisionShape2D").color = color
	
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()

func pickup():
	if held:
		return
	mode = RigidBody2D.MODE_STATIC
	held = true

func drop(impulse=Vector2.ZERO):
	# signal card has moved to the server
	if held:
		mode = RigidBody2D.MODE_CHARACTER
		held = false
