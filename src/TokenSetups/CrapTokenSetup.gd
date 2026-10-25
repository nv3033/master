extends AbstractTokenSetup

class_name CrapTokenSetup

var even_odd : int = 0


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card.suit == card_on.suit and card_on.nominal % 2 == even_odd:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.OnCard


func image() -> Texture:
	return preload("res://assets/Tokens/Крап1.png")


func description() -> String:
	if even_odd == 0:
		return "Крап. Если эта карта совпадает по масти со скрытой\nи является чётной, то скрытая карта выигрывает"
	else:
		return "Крап. Если эта карта совпадает по масти со скрытой\nи является нечётной, то скрытая карта выигрывает"
		
