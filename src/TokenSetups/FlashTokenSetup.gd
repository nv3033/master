extends AbstractTokenSetup

class_name FlashTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		var matches : int = 0
		for second_card:PlayableCard in cards_pool:
			if card.suit == second_card.suit:
				matches += 1
			
			if matches >= 2:
				result.append(card)
				continue
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Флеш.png")


func description() -> String:
	return "Флэш. Если одна из скрытых карт совпадает\nпо масти с двумя или более картами, то она выигрывает"
