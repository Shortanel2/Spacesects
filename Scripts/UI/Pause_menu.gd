extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("Pause_overlay")

var paused: = false setget set_paused

func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func _on_Continue_pressed():
	self.paused = not paused


func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scene/UI/Title_screen.tscn")
	self.paused = not paused
