extends AbstractTokenSetup

class_name StreetTokenSetup


@warning_ignore("unused_parameter")
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], 
		card_on:PlayableCard = null) -> Array[PlayableCard]:
	
	var result : Array[PlayableCard] = []
	
	for card:PlayableCard in hidden_cards:
		var side_cards : Array[PlayableCard] = []
		for pool_card:PlayableCard in cards_pool:
			if pool_card.side == card.side:
				side_cards.append(pool_card)
		
		if _has_street_with(card, side_cards):
			result.append(card)
	
	return result


func _has_street_with(card:PlayableCard, side_cards:Array[PlayableCard]) -> bool:
	for start in range(side_cards.size()):
		for end in range(start, side_cards.size()):
			var visible_len : int = end - start + 1
			if visible_len < 2:
				continue
			
			# Insert the hidden card at any position in this contiguous run.
			# If it must only be at an end, check only 0 and visible_len.
			for insert_at in range(visible_len + 1):
				var seq : Array[int] = []
				for k in range(visible_len + 1):
					if k == insert_at:
						seq.append(card.nominal)
					if k < visible_len:
						seq.append(side_cards[start + k].nominal)
				
				if _is_consecutive(seq):
					return true
	
	return false


func _is_consecutive(seq:Array[int]) -> bool:
	if seq.size() < 3:
		return false
	
	var step : int = seq[1] - seq[0]
	if abs(step) != 1:
		return false
	
	for i in range(2, seq.size()):
		if seq[i] - seq[i - 1] != step:
			return false
	
	return true


func type() -> Type:
	return Type.General


func image() -> Texture:
	return preload("res://assets/Tokens/Стрит.png")


func description() -> String:
	return "Стрит. Если подряд есть серия со скрытой картой,\nсостоящая минимум из 3 карт, то скрытая карта выигрывает."
