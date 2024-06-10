local d6_side_info = SMODS.D6_Side({
	key = "chaos_side",
	loc_txt = {
		name = "{C:attention}Chaos{}",
		text = {
			"{C:attention}Copies ability of a",
			"{C:attention}random die when rolled",
			"{C:inactive}(Copied die: {C:attention}#1#{C:inactive})"
		},
		label = "Chaos"
	},
	config = {},
	atlas = "d6_side_chaos",
	icon_pos = {x=0, y=4},
	upgrade = "chaos_plus_side",
	loc_vars = function(self, info_queue, card)
		sendInfoMessage("card: "..tostring(card))
		if card then sendInfoMessage("chaos_selected_die: "..tostring(card.ability.extra.chaos_selected_die)) end
		if not (card and card.ability.extra.chaos_selected_die) then return {vars = {localize("k_na")}}
		else return {vars = {localize{type = 'name_text', key = card.ability.extra.chaos_selected_die, set = 'Other'}}}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		local viable_die_sides = {}
		for k, v in pairs(G.P_D6_SIDES) do
			if k ~= self.key then viable_die_sides[#viable_die_sides+1] = k end
		end
		card.ability.extra["chaos_selected_die"] = pseudorandom_element(viable_die_sides, pseudoseed("chaos_selected_die"))
		if SMODS.D6_Sides[card.ability.extra.chaos_selected_die].add_to_deck and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].add_to_deck) == "function" then
			SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:add_to_deck(card, from_debuff)
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if SMODS.D6_Sides[card.ability.extra.chaos_selected_die].remove_from_deck and type(SMODS.D6_Sides[card.ability.extra.chaos_selected_die].remove_from_deck) == "function" then
			SMODS.D6_Sides[card.ability.extra.chaos_selected_die]:remove_from_deck(card, from_debuff)
		end
		card.ability.extra["chaos_selected_die"] = nil
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
	order = 5,
})

return d6_side_info