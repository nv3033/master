extends AbstractTokenSetup

class_name HighTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card.nominal < card_on.nominal:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.OnCard


func image() -> Texture:
	return preload("res://assets/Tokens/Хай Лоу 2.png")


func description() -> String:
	return "Больше. Если скрытая карта меньше по номиналу той,\nна которой жетон, то эта скрытая карта выигрывает"
