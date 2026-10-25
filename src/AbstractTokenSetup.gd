@abstract
extends RefCounted

class_name AbstractTokenSetup

enum Type
{
	General, # жетон, который влияет на все поле
	OnCard, # жетон, который лежит на карте
	Sided # жетон, который влияет на карты одной стороны
}

@abstract
func won_cards(hidden_cards:Array[PlayableCard], cards_pool:Array[PlayableCard], card_on:PlayableCard = null) -> Array[PlayableCard]


@abstract
func type() -> Type


@abstract
func description() -> String


@abstract
func image() -> Texture
