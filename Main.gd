extends Node

onready var click_protect = get_node("Click Protect")
onready var File_Dialog = click_protect.get_node('FileDialog')

onready var DrawingWorkspace = get_node("VBoxContainer/Drawing Workspace")


func _ready():
	DrawingWorkspace.click_protect = click_protect
	DrawingWorkspace.File_Dialog = File_Dialog
	File_Dialog.connect('popup_hide', DrawingWorkspace, '_on_FileDialog_popup_hide')
	File_Dialog.connect('file_selected', DrawingWorkspace, '_on_FileDialog_file_selected')

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == OS.find_scancode_from_string("ESCAPE"):
				if DrawingWorkspace.get_focus_owner() != null:
					DrawingWorkspace.get_focus_owner().release_focus()
