extends AbstractTokenSetup

class_name RangeTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	if cards_pool.size() < 2:
		return []
	
	var result : Array[PlayableCard] = []
	
	var first : PlayableCard = cards_pool[0]
	var last : PlayableCard = cards_pool[len(cards_pool) - 1]
	
	for card:PlayableCard in hidden_cards:
		if min(first.nominal, last.nominal) < card.nominal \
			and card.nominal < max(first.nominal, last.nominal):
		
			result.append(card)
	
	return result


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Рейндж.png")


func description() -> String:
	return "Рейндж. Если скрытая карта находится по номиналу\nв диапазоне между первой и последней открытыми картами, то она выигрывает."
