local players = {}


local function set_checkpoint(player, pos)
	local name = player:get_player_name()
	local ppos = player:getpos()
	players[name] = ppos

end



minetest.register_chatcommand("spawn2", {
	description = "Move player back to spawn",
	privs = {
		interact = true
	},
	
	func = function(name, param)
		
		local player = minetest.get_player_by_name(name); --if player then player:set_hp(0) end
		local pos = player:get_pos()
	
		minetest.chat_send_player(name, minetest.colorize("white", "<Mr.Bot> "..name.. ", teleport in process, don't move"))
	
		set_checkpoint(player, pos)
				
			minetest.after(5, function() 
				local pos1 = players[name]
				local pos2 = player:get_pos()
				
				if (pos1.y > pos2.y or pos1.x > pos2.x or pos1.z > pos2.z) or (pos1.y < pos2.y or pos1.x < pos2.x or pos1.z < pos2.z) then

					minetest.chat_send_player(name, minetest.colorize("red", "<Mr.Bot> "..name.. ", you moved, teleport reseted"))

				else
					player:setpos({x=0,y=10,z=0})
				end
			end)
		
	end
})