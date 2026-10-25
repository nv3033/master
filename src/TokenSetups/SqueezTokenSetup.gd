extends AbstractTokenSetup

class_name SqueezTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card.nominal == len(cards_pool):
			result.append(card)

	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Сквиз.png")


func description() -> String:
	return "Сквиз. Если количество открытых карт равно номиналу\nодной из скрытых карт, то эта скрытая карта выигрывает."
