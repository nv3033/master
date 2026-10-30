extends AbstractTokenSetup

class_name FlashTokenSetup

var even_odd : int = 0

@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	
	var all_cards_nominals_sum : int = 0
	for sm_card:PlayableCard in cards_pool:
		all_cards_nominals_sum += sm_card.nominal
		
	for card:PlayableCard in hidden_cards:
		if (card.nominal + all_cards_nominals_sum) % 2 == even_odd:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Флеш.png")


func description() -> String:
	if even_odd == 0:
		return "Флэш. Если сумма номиналов всех карт и твоей\nодной из скрытых чётна, то она выигрывает."
	else: # == 1
		return "Флэш. Если сумма номиналов всех карт и твоей\nодной из скрытых нечётна, то она выигрывает."
