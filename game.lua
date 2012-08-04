function startgame()

	px = 1025/2
	py = 600/2
	pspeed = 100
	function love.update(dt)
		if love.keyboard.isDown("left") then
		  if px<120 then
		  else
			px = px - (pspeed *dt)
		  end
	   elseif love.keyboard.isDown("right") then
	      if px>920 then
		  else
			px = px + (pspeed *dt)
		  end
	   end

	   if love.keyboard.isDown("up") then
		  if py < 100 then
		  else
			py = py - (pspeed *dt)
		  end
	   elseif love.keyboard.isDown("down") then
		  if py>500 then
		  else
			py = py + (pspeed *dt)
		  end
	   end
	end
	function love.draw()
	  love.graphics.setColor( 0, 0, 0, 255)
	  love.graphics.rectangle("fill", 0, 0, 1025, 600)
	  love.graphics.setColor( 255, 255, 255, 255)
	  love.graphics.print("FPS: "..love.timer.getFPS(), 5, 0)
	  love.graphics.print("EGO", 1025/2,0)
	  love.graphics.setColor( 75, 75, 75, 255)
	  love.graphics.rectangle("fill", 0, 35, 1025, 565)
	  love.graphics.setColor( 125, 125, 125, 255)
	  love.graphics.rectangle("fill", 120, 100, 800, 400)
	  
	  love.graphics.draw(player, px, py, 0, .25)
	  
	end
end