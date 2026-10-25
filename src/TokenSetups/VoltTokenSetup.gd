extends AbstractTokenSetup

class_name VoltTokenSetup

var side : PlayingSides


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	assert(side != null)
	
	if len(cards_pool) <= 1:
		return []
	
	if cards_pool[0].side != side or cards_pool[len(cards_pool) - 1].side != side:
		return []
	
	var result : Array[PlayableCard] = []
	for card:PlayableCard in hidden_cards:
		if card.side != side:
			continue
		
		if card.suit != cards_pool[0].suit and card.suit != cards_pool[len(cards_pool) - 1].suit:
			result.append(card)
	
	return result


func type() -> Type:
	return Type.Sided


func image() -> Texture:
	return preload("res://assets/Tokens/Вольт.png")


func description() -> String:
	return "Вольт. Если первая и последняя карты владельца жетона являются первой и \n" \
		+ "последней картами в целом, а скрытая карта имеет другую масть, отличную от этих двух,\n" \
		+ "то эта скрытая карта выигрывает."
