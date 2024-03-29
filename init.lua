minetest.register_chatcommand("spawn2", {
	description = "Move player back to spawn",
	privs = {interact = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local pos = player:get_pos()
		
		minetest.chat_send_player(name, minetest.colorize("white", "<Mr.Bot> "..name.. ", teleport in process, don't move"))
		
		minetest.after(5, function(name, pos1)
				local player = minetest.get_player_by_name(name)
				if not player or player:get_hp() == 0 then
					return --Player isn't online or died
				end
				local pos2 = player:get_pos()
				if not vector.equals(pos1, pos2) then
						minetest.chat_send_player(name, minetest.colorize("red", "<Mr.Bot> "..name.. ", you moved, teleport reseted"))
				else
						player:setpos({x = 0, y = 10, z = 0})
				end
		end, name, pos)
	end
})
