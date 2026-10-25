extends AbstractTokenSetup

class_name SpoofTokenSetup

var side : PlayingSides


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	assert(side != null)
	
	var result : Array[PlayableCard] = []
	var player_cards : Array[PlayableCard] = []
	var player_sum : int = 0
	
	var enemy_cards : Array[PlayableCard] = []
	var enemy_sum : int = 0
	
	for card:PlayableCard in cards_pool:
		if card.side == PlayingSides.player:
			player_cards.append(card)
			player_sum += card.nominal
		elif card.side == PlayingSides.enemy:
			enemy_cards.append(card)
			enemy_sum += card.nominal
		else:
			assert(false)
	
	for card:PlayableCard in hidden_cards:
		if card.side != side:
			continue
		
		if side == PlayingSides.player:
			if player_sum + card.nominal < enemy_sum:
				result.append(card)
		elif side == PlayingSides.enemy:
			if enemy_sum + card.nominal < player_sum:
				result.append(card)
	
	return result


func type() -> Type:
	return Type.Sided


func image() -> Texture:
	return preload("res://assets/Tokens/Подмена.png")


func description() -> String:
	return "Подмена. Если сумма номиналов карт владельца жетона вместе со скрытой картой\n" + \
		"меньше суммы номиналов разыгранных противником карт,\nто данная скрытая карта выигрывает."
