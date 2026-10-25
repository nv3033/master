extends AbstractTokenSetup

class_name AdjustTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var total_sum : int = 0
	for card:PlayableCard in cards_pool:
		total_sum += card.nominal
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card_on.nominal * card.nominal < total_sum:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.OnCard


func image() -> Texture:
	return preload("res://assets/Tokens/Подгон2.png")


func description() -> String:
	return "Подгон. Если эта карта при перемножении на скрытую,\nменьше, чем сумма всех карт, то скрытая карта выигрывает."
