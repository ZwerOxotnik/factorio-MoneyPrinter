if MoneyPrinter.allow_default_recipes and (#lazyAPI.find_items_by_name("copper-plate") > 0) then
	local bottom_icon = {
		icon = "__base__/graphics/icons/coin.png",
		icon_size = 64
	}
	local top_icon = {
		icon = "__base__/graphics/icons/copper-plate.png",
		icon_size = 64,
		scale = 0.35
	}
	MoneyPrinter.create_recipe(100,  "copper-plate", "coin", bottom_icon, top_icon)
	MoneyPrinter.create_recipe(1000, "copper-plate", "coin", bottom_icon, top_icon)
	MoneyPrinter.create_recipe(5000, "copper-plate", "coin", bottom_icon, top_icon)
end
