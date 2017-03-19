-- Minetest Mod: "Misc Stuff"

-- Settings --
local infinite_lava = true -- Make lava source renewable.
local water_springs = true -- Add underground water springs.
local lava_springs = true -- Add underground lava springs.

-- Stuff --

if infinite_lava then

	minetest.override_item("default:lava_source", {
		liquid_renewable = true,
	})

	minetest.override_item("default:lava_flowing", {
		liquid_renewable = true,
	})

end

if water_springs then

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:water_source",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 25 * 25 * 25,
		clust_num_ores = 8,
		clust_size     = 3,
		height_min     = -10000,
		height_max     = -10,
	})

end

if lava_springs then

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:lava_source",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 35 * 35 * 35,
		clust_num_ores = 5,
		clust_size     = 2,
		height_min     = -31000,
		height_max     = -100,
	})

end
