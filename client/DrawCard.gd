extends CollisionShape2D

func _draw():
	var rect = Rect2(shape.get_extents().rotated(deg2rad(180)), shape.get_extents() * 2)
	draw_rect(rect, Color.red)
	
func _process(delta):
	if beingDragged:
		set_position(get_viewport().get_mouse_position())

var beingDragged = false

func _on_Card_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		beingDragged = event.is_pressed()
			
