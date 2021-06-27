extends Panel

var lines_y = []
var channel_y : PoolVector2Array = []
var compensation = 0.05

func _on_XY_Drawing_line_updated(lines):
	lines_y.clear()
	for line in lines:
		var line_y = []
		lines_y.append(line_y)
		for point in line:
			line_y.append(point.y)
	_draw_line_y()

func _draw():
	_draw_line_y()

func _draw_line_y():
	update()
	yield(self, 'draw')
	
	var y_scale = rect_size.y * 0.5
	var count_points = 0
	for line_y in lines_y:
		count_points += line_y.size() - 1
	if count_points >= 1:
		var distance_btwn_points : float = rect_size.x / float(count_points)
		var distance_btwn_points_on_curve : float = 1.0 / count_points
		var itteration = 0
		var new_channel : PoolVector2Array
		for line_y in lines_y.size():
			for point in lines_y[line_y].size() - 1:
				new_channel.append(Vector2(
						distance_btwn_points_on_curve * itteration, 
						-(lines_y[line_y][point])
					)
				)
				
				itteration += 1
			new_channel.append(
				Vector2(
					distance_btwn_points_on_curve * (itteration - compensation), 
					-(lines_y[line_y][ lines_y[line_y].size() - 1])
				)
			)
		
		new_channel.append(Vector2(1, new_channel[0].y))
		for i in new_channel.size() -1:
			draw_line(
					Vector2(
						new_channel[i].x * rect_size.x, 
						(-new_channel[i].y + 1) * y_scale
					),
					Vector2(
						new_channel[i + 1].x * rect_size.x, 
						(-new_channel[i + 1].y + 1) * y_scale
					),
					Color.white
				)
		channel_y = new_channel
	else:
		channel_y = []


func _Wobble_Adjust_changed(value):
	compensation = value
	_draw_line_y()
