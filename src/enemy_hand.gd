extends Control

class_name EnemyHand


func cards() -> Array[PlayableCard]:
	var result : Array[PlayableCard] = []
	for child:Node in %Cards.get_children():
		if child is PlayableCard:
			result.append(child)
		
	return result


func clear_cards() -> void:
	for card:PlayableCard in cards():
		card.queue_free()


func tokens() -> Array[RuleToken]:
	var result : Array[RuleToken] = []
	for child : Node in %Tokens.get_children():
		if child is RuleToken:
			result.append(child)
	
	return result


func clear_tokens() -> void:
	for token:RuleToken in tokens():
		token.queue_free()


func add_card(card:PlayableCard) -> void:
	card.state = PlayableCard.State.Hand
	card.visible_state = PlayableCard.VisibleState.Hidden
	card.responsive = false
	_node_set_parent(card, %Cards)


func add_token(token:RuleToken) -> void:
	token.state = RuleToken.State.Hand
	token.visible_state = RuleToken.VisibleState.Hidden
	token.responsive = false
	_node_set_parent(token, %Tokens)


func _node_set_parent(node:Node, parent:Node) -> void:
	if node.get_parent() != null:
		node.reparent(parent, false)
	else:
		parent.add_child(node)
