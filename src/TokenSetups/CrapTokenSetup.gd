extends AbstractTokenSetup

class_name CrapTokenSetup

@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card.suit == card_on.suit and card	.nominal % 2 == card_on.nominal % 2:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.OnCard


func image() -> Texture:
	return preload("res://assets/Tokens/Крап1.png")


func description() -> String:
	return "Крап. Если эта карта совпадает по чётности/нечётности\nи совпадает по масти со скрытой, то скрытая карта выигрывает"
		
