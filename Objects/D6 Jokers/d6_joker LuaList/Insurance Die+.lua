local d6_joker_info = SMODS.D6_Joker({
	key = "insurance_plus_die",
	loc_txt = {},
	discovered = true,
	d6_sides = {
		[1] = "nothing_side",
		[2] = "blocker_side",
		[3] = "blocker_side",
		[4] = "blocker_side",
		[5] = "blocker_side",
		[6] = "blocker_side"
	},
	rarity = 2,
	cost = 6,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	order = 1,
})

return d6_joker_info