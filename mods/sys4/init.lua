-- clear xdecor:stone_tile
if minetest.get_modpath("xdecor") then
   minetest.clear_craft(
      { output = "xdecor:stone_tile",
	recipe = {
	   {"default:cobble", "default:cobble"},
	   {"default:cobble", "default:cobble"}
	}
      })
end

-- override moreblocks:circle_stone_bricks
if minetest.get_modpath("moreblocks") and minetest.get_modpath("xdecor") then
   minetest.clear_craft(
      {
	 recipe = {
	    {"default:stone", "default:stone", "default:stone"},
	    {"default:stone", "", "default:stone"},
	    {"default:stone", "default:stone", "default:stone"},
	 }
      })
   
   minetest.register_craft(
      {
	 output = "moreblocks:circle_stone_bricks 8",
	 recipe = {
	    {"default:stone", "default:stone", "default:stone"},
	    {"default:stone", "default:coal_lump", "default:stone"},
	    {"default:stone", "default:stone", "default:stone"}
	 }
      })

   minetest.register_craft(
      {
	 output = "xdecor:stone_rune 4",
	 recipe = {
	    {"default:stone", "default:stone", "default:stone"},
	    {"default:stone", "", "default:stone"},
	    {"default:stone", "default:stone", "default:stone"}
	 }
      })
end

-- override default:furnace craft recipes
if minetest.get_modpath("default") then
   minetest.register_craft(
      {
	 output = "default:furnace",
	 recipe = {
	    {"default:cobble", "default:cobble", "default:cobble"},
	    {"default:cobble", "", "default:cobble"},
	    {"default:cobble", "default:cobble", "default:cobble"}
	 }
      })
   minetest.register_craft(
      {
	 output = "default:furnace",
	 recipe = {
	    {"default:desert_cobble", "default:desert_cobble", "default:desert_cobble"},
	    {"default:desert_cobble", "", "default:desert_cobble"},
	    {"default:desert_cobble", "default:desert_cobble", "default:desert_cobble"}
	 }
      })
end
			  
-- Make xdecor and food bowls to be usable to drink water
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

-- If technic mod and moreblocks then clear compressed cobblestone craft and make it with technic compressor (LV or MV)
if minetest.get_modpath("technic") and minetest.get_modpath("moreblocks") then
   minetest.clear_craft(
      { output = "moreblocks:cobble_compressed",
	recipe = {
	   {"default:cobble", "default:cobble", "default:cobble"},
	   {"default:cobble", "default:cobble", "default:cobble"},
	   {"default:cobble", "default:cobble", "default:cobble"}
	}
      })

   technic.register_compressor_recipe({input = {"default:cobble 9"}, output = "moreblocks:cobble_compressed"})
end

-- Register craft recipe of bones:bones with bonemeal:bone
if minetest.get_modpath("bones")
   and minetest.get_modpath("bonemeal") and bonemeal
then
   minetest.register_craft(
      {
	 output = "bones:bones",
	 recipe = {
	    {"bonemeal:bone", "bonemeal:bone", "bonemeal:bone"},
	    {"bonemeal:bone", "bonemeal:bone", "bonemeal:bone"},
	    {"bonemeal:bone", "bonemeal:bone", "bonemeal:bone"},
	 }
      })
end

-- Override craft recipe of witchcraft:shelf
if minetest.get_modpath("witchcraft") then
   if minetest.get_modpath("vessels") then
      minetest.clear_craft(
	 {
	    recipe = {
	       {"group:wood", "group:wood", "group:wood"},
	       {"group:potion", "group:potion", "group:potion"},
	       {"group:wood", "group:wood", "group:wood"},
	    }
	 })
      
      minetest.register_craft(
	 {
	    output = "witchcraft:shelf",
	    recipe = {
	       {"", "group:potion", ""},
	       {"group:potion", "vessels:shelf", "group:potion"},
	    }
	 })
   end
   
   -- Redefine witchcraft potions table
   local pot_new =
      {
	 {"blue", "blue2", "default:leaves", "brown", "default:dirt", "red", "purple"}, -- replace waterlily by leaves (flowers_plus incompatibility i think...)
	 {"blue2", "green", "default:papyrus", "", "", "gred", "magenta"},
	 {"green", "green2", "default:sapling", "", "", "yellow", "yllwgrn"},
	 {"green2", "yellow", "default:mese_crystal_fragment", "", "", "blue", "cyan"},
	 {"yellow", "ggreen", "flowers:mushroom_brown", "", "", "green", "yllwgrn"},
	 {"ggreen", "cyan", "witchcraft:slime_bottle", "", "", "gcyan", "aqua"},
	 {"cyan", "gcyan", "witchcraft:bottle_medicine", "", "", "blue", "blue2"},
	 {"gcyan", "orange", "default:torch", "", "", "ggreen", "aqua"},
	 {"orange", "yllwgrn", "tnt:gunpowder", "", "", "red", "redbrown"},
	 {"yllwgrn", "gold", "default:steel_ingot", "", "", "green", "green2"},
	 {"gold", "aqua", "default:diamond", "", "", "", ""},
	 {"aqua", "", "", "", "", "", ""},
	 {"brown", "redbrown", "flowers:mushroom_red", "", "", "red", "redbrown"},
	 {"redbrown", "gred", "default:apple", "", "", "", ""},
	 {"gred", "red", "witchcraft:herb", "", "", "blue2", "magenta"}, -- replace witchcraft:herbs (inexistant) by witchcraft:herb
	 {"red", "magenta", "witchcraft:tooth", "", "", "blue", "purple"},
	 {"magenta", "gpurple", "witchcraft:bottle_slime", "", "", "cyan", "darkpurple"},
	 {"gpurple", "purple", "witchcraft:bone_bottle", "", "", "yllwgrn", "green2"},
	 {"purple", "darkpurple", "default:glass", "", "", "yellow", "green"},
	 {"darkpurple", "silver", "default:steel_ingot", "", "", "", ""},
	 {"silver", "grey", "witchcraft:bone", "", "", "", ""},
	 {"grey", "aqua", "default:diamond", "", "", "", ""},
      }

   -- Override pots on_rightclick
   for _, row in ipairs(pot_new) do
      local color = row[1]
      local newcolor = row[2]
      local newcolor2 = row[4]
      local ingredient = row[3]
      local ingredient2 = row[5]
      local combine = row[6]
      local cresult = row[7]

      minetest.override_item(
	 "witchcraft:pot_"..color,
	 {
	    on_rightclick = function(pos, node, clicker, item, _)
	       local wield_item = clicker:get_wielded_item():get_name()
	       if wield_item == "vessels:glass_bottle" and clicker:get_wielded_item():get_count() == 3 then
		  item:replace("witchcraft:potion_"..color)
		  minetest.env:add_item({x=pos.x, y=pos.y+1.5, z=pos.z}, "witchcraft:potion_"..color)
		  minetest.env:add_item({x=pos.x, y=pos.y+1.5, z=pos.z}, "witchcraft:potion_"..color)
		  minetest.set_node(pos, {name="witchcraft:pot", param2=node.param2})
	       elseif wield_item == "vessels:glass_bottle" and clicker:get_wielded_item():get_count() ~= 3 then
		  item:replace("witchcraft:potion_"..color)
		  minetest.set_node(pos, {name="witchcraft:pot", param2=node.param2})
	       else
		  if wield_item == ingredient then
		     minetest.set_node(pos, {name="witchcraft:pot_"..newcolor, param2=node.param2})
		     item:take_item()
		  elseif wield_item == ingredient2 then
		     minetest.set_node(pos, {name="witchcraft:pot_"..newcolor2, param2=node.param2})
		     item:take_item()
		  elseif wield_item == "bucket:bucket_water" then
		     minetest.set_node(pos, {name="witchcraft:pot_blue", param2=node.param2})
		     item:replace("bucket:bucket_empty")
		  elseif wield_item == "witchcraft:potion_"..combine then
		     minetest.set_node(pos, {name="witchcraft:pot_"..cresult, param2=node.param2})
		     item:replace("vessels:glass_bottle")
		  end
	       end
	    end
	 })
   end
end
