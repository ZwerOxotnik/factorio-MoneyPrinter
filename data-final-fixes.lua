if MoneyPrinter.allow_default_recipes and (#lazyAPI.find_items_by_name("copper-plate") > 0) then
	local top_icon = {
		icon = "__base__/graphics/icons/copper-plate.png",
		icon_size = 64,
		scale = 0.35
	}
	local bottom_icon = {
		icon = "__base__/graphics/icons/coin.png",
		icon_size = 64
	}
	local subgroup = "coin-for-copper-plate"
	if EasyAPI then
		MoneyPrinter.create_recipe(subgroup, 100,  "copper-plate", "coin", 100, bottom_icon, top_icon)
		bottom_icon = {
			icon = "__EasyAPI__/graphics/coinX50.png",
			icon_size = 64
		}
		MoneyPrinter.create_recipe(subgroup, 1000, "copper-plate", "coinX50", 1000/50, bottom_icon, top_icon)
		bottom_icon = {
			icon = "__EasyAPI__/graphics/coinX2500.png",
			icon_size = 64
		}
		MoneyPrinter.create_recipe(subgroup, 5000, "copper-plate", "coinX2500", 5000/2500, bottom_icon, top_icon)
	else
		MoneyPrinter.create_recipe(subgroup, 100,  "copper-plate", "coin", 100,  bottom_icon, top_icon)
		MoneyPrinter.create_recipe(subgroup, 1000, "copper-plate", "coin", 1000, bottom_icon, top_icon)
		MoneyPrinter.create_recipe(subgroup, 5000, "copper-plate", "coin", 5000, bottom_icon, top_icon)
	end
end
