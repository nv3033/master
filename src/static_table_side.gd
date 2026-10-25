extends Control

class_name StaticTableSide

signal get_token_requested
signal scroll_clicked


func set_bag_enabled(enabled:bool) -> void:
	%GetTokenButton.disabled = not enabled
	if enabled:
		%GetTokenButton.material.set_shader_parameter("width", 5.0)
	else:
		%GetTokenButton.material.set_shader_parameter("width", 0.0)


func hidden_cards() -> Array[PlayableCard]:
	var result : Array[PlayableCard] = []
	for child:Node in %EnemyHiddenCards.get_children() + %PlayerHiddenCards.get_children():
		if child is PlayableCard:
			result.append(child)
	
	return result


func add_hidden_card(card:PlayableCard) -> void:
	card.responsive = false
	if card.side == PlayingSides.player:
		card.visible_state = PlayableCard.VisibleState.VisibleOnlyToPlayer
		_node_set_parent(card, %PlayerHiddenCards)
	elif card.side == PlayingSides.enemy:
		card.visible_state = PlayableCard.VisibleState.Hidden
		_node_set_parent(card, %EnemyHiddenCards)
	else:
		assert(false)


func clear_hidden_cards() -> void:
	for card:PlayableCard in hidden_cards():
		card.queue_free()


func _on_get_token_button_pressed() -> void:
	get_token_requested.emit()


func _node_set_parent(node:Node, parent:Node) -> void:
	if node.get_parent() != null:
		node.reparent(parent, false)
	else:
		parent.add_child(node)


func _on_get_token_button_mouse_entered() -> void:
	%BahHoverSound.play()


func _on_scroll_button_mouse_entered() -> void:
	%BahHoverSound.play()


func _on_scroll_button_pressed() -> void:
	%ScrollSound.play()
	scroll_clicked.emit()
