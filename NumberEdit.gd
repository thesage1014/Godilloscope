extends LineEdit

export var min_number : int = 0
export var max_number : int = 100

var old_number : String

signal number_entered(number)

func _ready():
	max_length = len(String(max_number))

func _on_text_entered(new_text):
	if new_text.is_valid_integer():
		var number = int(new_text)
		text = String(clamp(int(text), min_number, max_number))
		old_number = text
		release_focus()
		emit_signal('number_entered', number)
	else:
		text = old_number
		
