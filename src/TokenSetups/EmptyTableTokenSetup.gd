extends AbstractTokenSetup

class_name EmptyTableTokenSetup

var side : PlayingSides


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	assert(side != null)
	
	var yours_card : Array[PlayableCard] = []
	var opponent_card : Array[PlayableCard] = []
	for card:PlayableCard in cards_pool:
		if card.side == side:
			yours_card.append(card)
		else:
			opponent_card.append(card)
	
	var result : Array[PlayableCard] = []
	if len(yours_card) >= 2 and len(opponent_card) >= 2:
		for card:PlayableCard in hidden_cards:
			if card.side != side:
				continue
			
			var good_suits : Array[PlayableCard.Suit] = []
			good_suits.append(card.suit)
			for your_card:PlayableCard in yours_card:
				good_suits.append(your_card.suit)
			
			var good : bool = true
			for op_card:PlayableCard in opponent_card:
				if op_card.suit in good_suits:
					good = false
					break
			
			if good:
				result.append(card)
	
	return result


func type() -> Type:
	return Type.Sided


func image() -> Texture:
	return preload("res://assets/Tokens/Пустой стол.png")


func description() -> String:
	return "Пустой стол. Если на столе лежат хотя бы по 2 карты с каждой стороны\n" \
	+ "и среди твоих карт и данной скрытой карты нет ни одного номинала карт противника, то она выигрывает."
