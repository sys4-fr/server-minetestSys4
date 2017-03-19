--dofile(minetest.get_modpath("senderman").."/api.lua")

--Senderman

mobs:register_mob("senderman:senderman", {
	type = "monster",
	passive = false,
	hp_max = 30,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 5.4, 0.5},
	visual = "mesh",
	mesh = "sender_man.x",
	--mesh = "mobs_tree_monster.b3d",
	textures = {
	   {"sender_man.png"},
	},
	visual_size = {x=8,y=8},
	makes_footstep_sound = false,
	view_range = 30,
	walk_velocity = 3,
	run_velocity = 6,
	damage = 4,
	drops = {
		{name = "default:nyancat",
		chance = 1,
		min = 3,
		max = 5,},
	},
	light_resistant = true,
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 2,
	attack_type = "dogfight",
	jump = true,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	}
})

mobs:register_spawn("senderman:senderman", {"default:dirt_with_grass", "default:desert_sand"}, 3, -1, 9999, 3, 31000)
mobs:register_egg("senderman:senderman", "Spawn Senderman", "senderman_egg.png", 1)

--Egg

--minetest.register_craftitem("senderman:senderegg", {
--	description = "Spawn Senderman",
--	inventory_image = "senderman_egg.png",
--	wield_image = inventory_image,
--	on_place = function(itemstack, placer, pointed_thing)
--		if pointed_thing.above then
--			minetest.env:add_entity(pointed_thing.above, "senderman:senderman")
--			itemstack:take_item()
--		end
--		return itemstack
--	end,
--})

--minetest.register_craft({
--	output = "senderman:senderegg",
--	type = "shapeless",
--	recipe = {"spawneggs:egg", "default:nyancat"},
--})

--Log

if minetest.setting_get("log_mods") then
	minetest.log("action", "senderman is watching")
end
