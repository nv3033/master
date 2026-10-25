extends MarginContainer

class_name PlayingTable

const CARD_PLACEHOLDER : PackedScene = preload("res://src/card_placeholder.tscn")

signal card_clicked(card:PlayableCard)

var _tokens_on_cards : Dictionary[RuleToken, PlayableCard] = {}


func played_cards() -> Array[PlayableCard]:
	var result : Array[PlayableCard] = []
	for child:Node in %EnemyPlayedCards.get_children() + %PlayerPlayedCards.get_children():
		if child is PlayableCard:
			result.append(child)
	
	return result


func clear_played_cards() -> void:
	for child:Node in %EnemyPlayedCards.get_children() + %PlayerPlayedCards.get_children():
		if child.get_index() != 0:
			child.queue_free()


func played_general_tokens() -> Array[RuleToken]:
	var result : Array[RuleToken] = []
	for child:Node in %GeneralTokens.get_children():
		if child is RuleToken:
			result.append(child)
	
	return result


func played_side_tokens() -> Array[RuleToken]:
	var result : Array[RuleToken] = []
	for child:Node in %EnemyTokens.get_children() + %PlayerTokens.get_children():
		if child is RuleToken:
			result.append(child)
	
	return result


func played_cards_tokens() -> Dictionary[RuleToken, PlayableCard]:
	return _tokens_on_cards.duplicate()


func clear_tokens() -> void:
	for child:Node in %EnemyTokens.get_children() + %PlayerTokens.get_children() + %GeneralTokens.get_children():
		if child.get_index() != 0:
			child.queue_free()
	
	_tokens_on_cards = {}


func select_card_async() -> PlayableCard:
	for card:PlayableCard in played_cards():
		card.responsive = true
	
	var result : PlayableCard = await card_clicked
	
	for card:PlayableCard in played_cards():
		card.responsive = false
	
	return result


func play_card(card:PlayableCard) -> void:
	card.state = PlayableCard.State.Played
	card.visible_state = PlayableCard.VisibleState.Visible
	card.responsive = false
	card.clicked.connect(_on_card_clicked, CONNECT_APPEND_SOURCE_OBJECT)
	if card.side == PlayingSides.player:
		_node_set_parent(card, %PlayerPlayedCards)
		%EnemyPlayedCards.add_child(CARD_PLACEHOLDER.instantiate())
	elif card.side == PlayingSides.enemy:
		_node_set_parent(card, %EnemyPlayedCards)
		%PlayerPlayedCards.add_child(CARD_PLACEHOLDER.instantiate())
	else:
		assert(false)


func play_token(token:RuleToken, on_card:PlayableCard = null) -> void:
	token.state = RuleToken.State.Played
	token.visible_state = RuleToken.VisibleState.Visible
	token.responsive = false
	if token.setup.type() == AbstractTokenSetup.Type.OnCard:
		if on_card.token == null:
			on_card.token = token
			_tokens_on_cards[token] = on_card
	elif token.setup.type() == AbstractTokenSetup.Type.General:
		_node_set_parent(token, %GeneralTokens)
	elif token.setup.type() == AbstractTokenSetup.Type.Sided:
		if token.side == PlayingSides.player:
			_node_set_parent(token, %PlayerTokens)
		elif token.side == PlayingSides.enemy:
			_node_set_parent(token, %EnemyTokens)
		else:
			assert(false)
	else:
		assert(false)


func _on_card_clicked(card:PlayableCard) -> void:
	card_clicked.emit(card)


func _node_set_parent(node:Node, parent:Node) -> void:
	if node.get_parent() != null:
		node.reparent(parent, false)
	else:
		parent.add_child(node)
