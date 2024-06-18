local d6_side_info = SMODS.D6_Side({
	key = "payout_plus_side",
	loc_txt = {
		name = "{C:attention}Payout+{}",
		text = {
			"{C:attention}Earn {C:money}$#1#{C:attention} at",
			"{C:attention}end of round"
		},
		label = "Payout+"
	},
	config = {money = 12},
	atlas = "d6_side_payout",
	icon_pos = {x=4, y=2},
	pos = {x=0, y=1},
	upgrade = "payout_plus2_side",
	loc_vars = function(self, info_queue)
		return {vars = {self.config.money}}
	end,
	calc_dollar_bonus = function(self, card)
		return self.config.money
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 4,
})

return d6_side_info