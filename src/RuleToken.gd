@abstract
extends Control

class_name RuleToken

signal clicked

enum State
{
	Hand, Played, None
}

enum VisibleState
{
	Visible, Hidden
}

var setup : AbstractTokenSetup
var state : State = State.None
var side : PlayingSides
var responsive : bool = true

var visible_state : VisibleState = VisibleState.Visible :
	set(v):
		visible_state = v
		if visible_state == VisibleState.Visible:
			tooltip_text = setup.description()
		else:
			tooltip_text = ""
		
		_on_visible_state_changed()
	get:
		return visible_state


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("main_click") and get_global_rect().has_point(get_global_mouse_position()):
		clicked.emit()


func _on_visible_state_changed() -> void:
	pass
