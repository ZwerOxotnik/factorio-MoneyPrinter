MoneyPrinter = {
	allow_default_recipes = true
}


---@param required_count integer # 1 by default
---@param required_item_name string
---@param result_item_name string? # "coin" by default
---@param result_count integer # 1 by default
---@param bottom_icon table?
---@param top_icon table?
MoneyPrinter.create_recipe = function(required_count, required_item_name, result_item_name, result_count, bottom_icon, top_icon)
	required_count = required_count or 1
	result_item_name = result_item_name or "coin"

	local data = {
		type = "recipe",
		name = required_item_name .. "-" .. result_item_name .. "-" .. required_count,
		subgroup = "coins",
		category = "money",
		enabled = true,
		ingredients = {{required_item_name, required_count}},
		energy_required = required_count,
		order = result_item_name .. "-" .. required_count,
		result = result_item_name,
		result_count = result_count
	}
	if bottom_icon or top_icon then
		if bottom_icon and top_icon then
			data.icons = {bottom_icon, top_icon}
		else
			data.icons = {bottom_icon or top_icon}
		end
	end

	lazyAPI.add_prototype(data)
end
MoneyPrinter._create_recipe = MoneyPrinter.create_recipe


if mods["EasyAPI"] == nil then
	data:extend({
		{
			type = "item-group",
			name = "money",
			order = "z",
			icon = "__base__/graphics/icons/coin.png",
			icon_size = 64, icon_mipmaps = 4,
		}, {
			type = "item-subgroup",
			name = "coins",
			group = "money",
			order = "a"
		}, {
			type = "recipe-category",
			name = "money"
		}
	})
end


local money_printer = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"] or lazyAPI.vanilla_data["assembling-machine"]["assembling-machine-1"])
money_printer.name = "money-printer"
money_printer.minable = {mining_time = 0.2, result = money_printer.name}
money_printer.fast_replaceable_group = nil
money_printer.energy_usage = "750kW"
money_printer.allowed_effects = nil
money_printer.next_upgrade = nil
money_printer.crafting_speed = 1
money_printer.base_productivity = 0
money_printer.crafting_categories = {"money"}
local money_printer_recipe = table.deepcopy(data.raw.recipe["assembling-machine-1"] or lazyAPI.vanilla_data.recipe["assembling-machine-1"])
money_printer_recipe.name = money_printer.name
money_printer_recipe.result = money_printer.name
money_printer_recipe.enabled = true

data:extend({
	money_printer_recipe,
	money_printer, {
		type = "item",
		name = money_printer.name,
		icon = "__base__/graphics/icons/assembling-machine-1.png",
		icon_size = 64, icon_mipmaps = 4,
		subgroup = "coins",
		order = "a[" .. money_printer.name .. "]",
		place_result = money_printer.name,
		stack_size = 50
	}
})
