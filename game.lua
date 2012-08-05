require "person"
require "middleclass/middleclass"

function startgame()

	player = love.graphics.newImage("media/player.png")
	px = 1025/2
	py = 600/2
	pspeed = 100
	playerrot = 0
	
	ymax = 490
	ymin = 100
	xmax = 910
	xmin = 120
	
	spymax = 450
	spymin = 150
	spxmax = 870
	spxmin = 150
	
	bodies = 0
	
	function love.update(dt)
		if love.keyboard.isDown("up") and love.keyboard.isDown("left") then
			if py < ymin or px < xmin then
			else
				playerrot = -0.785398163
				py = py - (pspeed *dt)
				px = px - (pspeed *dt)
			end
		elseif love.keyboard.isDown("up") and love.keyboard.isDown("right") then
			if py < ymin or px > xmax then
			else
				playerrot = 0.785398163
				py = py - (pspeed *dt)
				px = px + (pspeed *dt)
			end
		elseif love.keyboard.isDown("down") and love.keyboard.isDown("left") then
			if py > ymax or px < xmin then
			else
				playerrot = -2.35619449
				py = py + (pspeed *dt)
				px = px - (pspeed *dt)
			end
		elseif love.keyboard.isDown("down") and love.keyboard.isDown("right") then
			if py > ymax or px > xmax then
			else
				playerrot = 2.35619449
				py = py + (pspeed *dt)
				px = px + (pspeed *dt)
			end
		else
			if love.keyboard.isDown("left") then
			  if px<xmin then
			  else
				playerrot =(-1.57079633)
				px = px - (pspeed *dt)
			  end
		   elseif love.keyboard.isDown("right") then
			  if px>xmax then
			  else
				playerrot =(1.57079633)
				px = px + (pspeed *dt)
			  end

		   elseif love.keyboard.isDown("up") then
			  if py < ymin then
			  else
				playerrot =(0)
				py = py - (pspeed *dt)
			  end
		   elseif love.keyboard.isDown("down") then
			  if py>ymax then
			  else
				playerrot =(3.14159265)
				py = py + (pspeed *dt)
			  end
		   end
		end
	end
	function love.draw()
	  --love.graphics.setColor( 0, 0, 0, 255)
	  --love.graphics.rectangle("fill", 0, 0, 1025, 600)
	  love.graphics.setColor( 255, 255, 255, 255)
	  love.graphics.print("FPS: "..love.timer.getFPS(), 5, 0)
	  love.graphics.print("EGO", 1025/2,0)
	  love.graphics.setColor( 75, 75, 75, 255)
	  love.graphics.rectangle("fill", 0, 35, 1025, 565)
	  love.graphics.setColor( 125, 125, 125, 255)
	  love.graphics.rectangle("fill", 120, 100, 800, 400)
	  
	  spawnCrowd(bodies)
	  
	  love.graphics.draw(player, px, py, playerrot, .33, .33, 32, 32)

	  
	  
	end

end