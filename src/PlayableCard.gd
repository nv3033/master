extends Control

class_name PlayableCard

signal clicked

enum Suit
{
	# пики, червы, трефы, бубны
	Spades, Hearts, Clubs, Diamonds
}

enum State
{
	Played, Hand, Hidden, HiddenRevealed, None
}

enum VisibleState
{
	Visible, Hidden, VisibleOnlyToPlayer
}

@export
var nominal : int

@export
var suit : Suit

var state : State = State.None :
	set(v):
		state = v
		_on_state_changed()
	get:
		return state

var token : RuleToken :
	set(v):
		if token == null:
			token = v
			_add_token(v)
	get:
		return token

var side : PlayingSides
var responsive : bool = true

var visible_state : VisibleState = VisibleState.Visible :
	set(v):
		visible_state = v
		_on_visible_state_changed()
	get:
		return visible_state


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("main_click") and get_global_rect().has_point(get_global_mouse_position()):
		clicked.emit()


func _on_state_changed() -> void:
	pass


func _on_visible_state_changed() -> void:
	pass


func _add_token(new_token:RuleToken) -> void:
	add_child(new_token)
