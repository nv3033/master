extends AbstractTokenSetup

class_name SuitTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	if cards_pool.size() < 3:
		return result
	
	for card:PlayableCard in hidden_cards:
		for i:int in range(2, cards_pool.size()):
			var seq : Array[PlayableCard] = [cards_pool[i - 2], cards_pool[i - 1], cards_pool[i]]
			var suits : Array = [seq[0].suit, seq[1].suit, seq[2].suit]
			var unique_suits : Array = []
			for s in suits:
				if not unique_suits.has(s):
					unique_suits.append(s)
			if unique_suits.size() == 3:
				if card.suit != seq[0].suit and card.suit != seq[1].suit and card.suit != seq[2].suit:
					if not result.has(card):
						result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Мизер.png")


func description() -> String:
	return "Мизер. Если три разные масти идут подряд, а ваша скрытая карта четвёртая другая масть, то эта карта выигрывает."
