function test()

	player = {
        x = 256,
        y = 256
    }
	
	love.graphics.rectangle("fill", 0, 0, 32, 32)
	
	function love.keypressed(key)
		if key == "up" then
			player.y = player.y - 32
		elseif key == "down" then
			player.y = player.y + 32
		elseif key == "left" then
			player.x = player.x - 32
		elseif key == "right" then
			player.x = player.x + 32
		end
	end
end 
