extends AbstractTokenSetup

class_name StreetTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		for second_card:PlayableCard in cards_pool:
			if abs(second_card.nominal - card.nominal) == 1:
				result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Стрит.png")


func description() -> String:
	return "Стрит. Если подряд есть серия со скрытой картой\n, состоящая минимум из 2 карт, то скрытая карта выигрывает."
