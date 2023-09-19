extends Node
class_name Upgrade

var upgrade: float = 10.0
var cost: float = 15.0
var rank: int = 0
var rate: float = 1.15

func rank_up():
	if Stats.coins >= cost:
		Stats.coins -= cost
		Stats.coins = snapped(Stats.coins, 0.01)
		rank += 1
		cost *= rate
		cost = snapped(cost, 0.01)
		upgrade *= rate

func check_afford():
	if cost > Stats.coins:
		return false
	else:
		return true

