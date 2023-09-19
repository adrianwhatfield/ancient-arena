extends Node
class_name Upgrade

var upgrade: float = 10.0
var cost: float = 15.0
var rank: int = 0
var rate: float = 1.15

func rank_up():
	if Stats.coins >= cost:
		Stats.coins -= cost
		rank += 1
		cost *= rate
		upgrade *= rate

