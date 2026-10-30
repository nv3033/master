extends AbstractTokenSetup

class_name CoinflipTokenSetup

var even_odd : int = 0

@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	if cards_pool.size() == 0:
		return []
	
	var result : Array[PlayableCard] = []
	var all_cards_nominals_sum: int = 0
	for i:PlayableCard in cards_pool:
		all_cards_nominals_sum += i.nominal
	for card:PlayableCard in hidden_cards:
		if (card.nominal + all_cards_nominals_sum) % 2 == even_odd:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Койнфлип.png")


func description() -> String:
	if even_odd == 0:
		return "Коинфлип. Если сумма номиналов всех карт и\nтвоей одной из скрытых чётна, то она выигрывает."
	else: # == 1
		return "Коинфлип. Если сумма номиналов всех карт и\nтвоей одной из скрытых нечётна, то она выигрывает."
		
