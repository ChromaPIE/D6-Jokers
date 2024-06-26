local d6_side_info = SMODS.D6_Side({
	key = "blocker_side",
	loc_txt = {},
	config = {},
	atlas = "d6_side_other",
	icon_pos = {x=7, y=0},
	pos = {x=0, y=1},
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 3,
})

return d6_side_info