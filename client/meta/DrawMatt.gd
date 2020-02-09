extends CollisionShape2D

var colorM = Color(randf(),randf(),randf())

func _draw():
	var rect = Rect2(shape.get_extents().rotated(deg2rad(180)), shape.get_extents() * 2)
	draw_rect(rect, colorM)
