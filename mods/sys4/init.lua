-- Make xdecor and food bowl to be usable to drink water
if minetest.get_modpath("thirsty") then
	if minetest.get_modpath("food") then
		thirsty.config.register_bowl = false
		thirsty.config.drink_from_container["food:bowl"] = thirsty.config.drink_from_container["thirsty:wooden_bowl"]

		minetest.override_item(
			"food:bowl",
			{liquids_pointable = true,
			 on_use = thirsty.on_use(nil)
			})
	end
	if minetest.get_modpath("xdecor") then
		thirsty.config.register_bowl = false
		thirsty.config.drink_from_container["xdecor:bowl"] = thirsty.config.drink_from_container["thirsty:wooden_bowl"]
		
		minetest.override_item(
			"xdecor:bowl",
			{liquids_pointable = true,
			 on_use = thirsty.on_use(nil)
			})
	end
end
