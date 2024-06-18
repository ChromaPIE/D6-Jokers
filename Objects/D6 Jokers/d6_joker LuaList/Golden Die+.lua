local d6_joker_info = SMODS.D6_Joker({
	key = "golden_plus_die",
	loc_txt = {
		name = "Golden Die+",
		text = {
			"Feels like 18K gold",
		}
	},
	discovered = true,
	d6_sides = {
		[1] = "payout_plus_side",
		[2] = "payout_side",
		[3] = "payout_plus_side",
		[4] = "payout_side",
		[5] = "payout_plus_side",
		[6] = "payout_side"
	},
	rarity = 2,
	cost = 8,
	upgrade = "golden_plus2_die",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 3,
})

return d6_joker_info