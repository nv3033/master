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
	for card:PlayableCard in hidden_cards:
		if card.side != side:
			continue
		
		var some_cards : Array = yours_card + [card]
		var good : bool = true
		for op_card:PlayableCard in opponent_card:
			for sm_card:PlayableCard in some_cards:
				if op_card.nominal == sm_card.nominal:
					good = false
					break
			
			if not good:
				break
		
		if good:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.Sided


func image() -> Texture:
	return preload("res://assets/Tokens/Пустой стол.png")


func description() -> String:
	return "Пустой стол. Если среди карт владельца жетона и скрытой\n" \
		+ "карты нет ни одного номинала карт противника, то она выигрывает."
