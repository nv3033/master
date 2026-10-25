extends AbstractTokenSetup

class_name SuitTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		for i:int in range(1, cards_pool.size()):
			var cards : Array[PlayableCard] = [card, cards_pool[i - 1], cards_pool[i]]
			if cards[0].suit != cards[1].suit and cards[0].suit != cards[2].suit and cards[1].suit != cards[2].suit:
				result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Мизер.png")


func description() -> String:
	return "Мизер. Если среди открытых карт две разные масти идут подряд, а \nскрытая карта третьей, другой масти, то скрытая карта выигрывает."
