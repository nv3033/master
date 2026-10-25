extends Control

class_name PlayerHand

signal token_play_request(token:RuleToken)
signal card_clicked(card:PlayableCard)


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


func select_card_async() -> PlayableCard:
	for card:PlayableCard in cards():
		card.responsive = true
	
	var result : PlayableCard = await card_clicked
	
	for card:PlayableCard in cards():
		card.responsive = false
	
	return result


func add_card(card:PlayableCard) -> void:
	card.state = PlayableCard.State.Hand
	card.clicked.connect(_on_card_clicked, CONNECT_APPEND_SOURCE_OBJECT)
	_node_set_parent(card, %Cards)


func add_token(token:RuleToken) -> void:
	token.state = RuleToken.State.Hand
	token.visible_state = RuleToken.VisibleState.Visible
	token.responsive = true
	token.clicked.connect(_on_token_clicked, CONNECT_APPEND_SOURCE_OBJECT)
	_node_set_parent(token, %Tokens)


func _on_card_clicked(card:PlayableCard) -> void:
	if card.get_parent() == %Cards:
		card_clicked.emit(card)


func _on_token_clicked(token:RuleToken) -> void:
	if token.get_parent() == %Tokens:
		token_play_request.emit(token)


func _node_set_parent(node:Node, parent:Node) -> void:
	if node.get_parent() != null:
		node.reparent(parent, false)
	else:
		parent.add_child(node)
