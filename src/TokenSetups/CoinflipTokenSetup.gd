extends AbstractTokenSetup

class_name CoinflipTokenSetup

var even_odd : int = 0

@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	if cards_pool.size() == 0:
		return []
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if (card.nominal + cards_pool[len(cards_pool) - 1].nominal) % 2 == even_odd:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Койнфлип.png")


func description() -> String:
	if even_odd == 0:
		return "Коинфлип. Если сумма номиналов последней карты и\nодной из скрытых владельца жетона чётна, то она выигрывает."
	else: # == 1
		return "Коинфлип. Если сумма номиналов последней карты и\nодной из скрытых карт владельца жетона нечетна, то она выигрывает."
		
