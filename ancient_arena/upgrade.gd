extends Resource
class_name Upgrade

@export var value: float
@export var cost: float
@export var rank: int
@export var rate: float

func rank_up():
		rank += 1
		cost *= rate
		cost = snapped(cost, 0.01)
		value *= rate
