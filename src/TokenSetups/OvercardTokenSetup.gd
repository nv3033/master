extends AbstractTokenSetup

class_name OvercardTokenSetup

var side : PlayingSides


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	assert(side != null)
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card.side != side:
			continue
		
		var greather : bool = true
		var was_side_crad : bool = false
		for second_card:PlayableCard in cards_pool:
			if second_card.side != side:
				was_side_crad = true
				if second_card.nominal >= card.nominal:
					greather = false
					break
		
		if greather and was_side_crad:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.Sided


func image() -> Texture:
	return preload("res://assets/Tokens/ОВЕРКАРТА.png")


func description() -> String:
	return "Оверкарта. Если скрытая карта владельца жетона по номиналу старше всех открытых\nкарт противника — она выигрывает."
