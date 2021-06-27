extends HBoxContainer

onready var button = $Button

var root

func setup(Item_name):
	button.text = Item_name

func _on_Delete_pressed():
	root._delete_line(get_position_in_parent())
	queue_free()

func _on_Button_toggled(button_pressed):
	if button_pressed:
		root._line_selected(get_position_in_parent())
	else:
		root
