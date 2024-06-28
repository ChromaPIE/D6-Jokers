local d6_side_info = SMODS.D6_Side({
	key = "pure_return_investment_side",
	loc_txt = {},
	config = {money_gained = 1, money_to_spend = 2},
	atlas = "d6_side_pure",
	icon_pos = {x=3, y=6},
	pos = {x=0, y=3},
	loc_vars = function(self, info_queue)
		return {vars = {self.config.money_gained, self.config.money_to_spend}}
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	pure = true,
	order = 5,
})

local ease_dollars_ref = ease_dollars
function ease_dollars(mod, instant)
	if mod < 0 and #SMODS.D6_Side.get_die_info("count", "pure_return_investment_side") > 0 then ease_dollars_ref((mod*-1)/2) end
	return ease_dollars_ref(mod, instant)
end

return d6_side_info