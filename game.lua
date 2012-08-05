function startgame()

		cam = {} -- new table for the hero
		cam.x = 300    -- x,y coordinates of the hero
		cam.y = 450
		cam.width = 30
		cam.height = 15
		cam.speed = 100
		cam.shots = {}
	   
		crowds ={}  
	   
		for i=0,7 do
			crowd = {}
			crowd.width = 40
			crowd.height = 20
			crowd.x = i * (crowd.width + 60) + 100
			crowd.y = crowd.height + 100
			table.insert(crowds, crowd)
		end
		
		camman = love.graphics.newImage("media/camman.png")
		player = love.graphics.newImage("media/player.png")
		px = 1025/2
		py = 600/2
		pspeed = 100
		playerrot = 0
	
		ymax = 500
		ymin = 100
		xmax = 920
		xmin = 120
	

	
	function love.keyreleased(key)
		if (key == " ") then
			shoot()
		end
	end
	
	function love.update(dt)
	
		--Dev Control Of Cam
		if love.keyboard.isDown("w") and love.keyboard.isDown("a")then
			if cam.y < ymin or cam.x < xmin then
			else
				camrot = -0.785398163
				cam.y = cam.y - (cam.speed *dt)
				cam.x = cam.x - (cam.speed *dt)
			end	
		elseif love.keyboard.isDown("w")  and love.keyboard.isDown("d")then
			if cam.y < ymin or cam.x > xmax then
			else
				camrot = 0.785398163
				cam.y = cam.y - (cam.speed *dt)
				cam.x = cam.x + (cam.speed *dt)
			end	
		elseif love.keyboard.isDown("s") and love.keyboard.isDown("l") then
			if cam.y > ymax or cam.x < xmin then
			else
				camrot = 2.35619449
				cam.y = cam.y + (cam.speed *dt)
				cam.x = cam.x - (cam.speed *dt)
			end 	
		elseif love.keyboard.isDown("s") and love.keyboard.isDown("r") then
			if cam.y > ymax or cam.x > xmin then
			else
				camrot = 2.35619449
				cam.y = cam.y + (cam.speed *dt)
				cam.x = cam.x + (cam.speed *dt)
			end 		
		else
			if love.keyboard.isDown("left") then
			  if cam.x < xmin then
			  else
				camrot =(-1.57079633)
				cam.x = cam.px - (cam.speed *dt)
			  end
			  
		   elseif love.keyboard.isDown("right") then
			  if cam.x > xmax then
			  else
				camrot =(1.57079633)
				cam.x = cam.x + (cam.speed *dt)
			  end

		   elseif love.keyboard.isDown("up") then
			  if cam.y < ymin then
			  else
				camrot =(0)
				cam.y = cam.y - (cam.speed *dt)
			  end
			  
		   elseif love.keyboard.isDown("down") then
			  if cam.y > ymax then
			  else
				camrot =(3.14159265)
				cam.y = cam.y + (cam.speed *dt)
		      end
	      end
	   end
		
		local remcrowd = {}
		local remShot = {}
			
		for i,v in ipairs(cam.shots) do
			v.y = v.y - dt * 100
			if v.y < 0 then
				table.insert(remShot, i)				
			end
		

		    -- check for collision with crowds
			for ii,vv in ipairs(crowds) do
				if CheckCollision(v.x,v.y,2,5,vv.x,vv.y,vv.width,vv.height) then
               
					-- mark the shot to be removed
					table.insert(remShot, i)
               
				end
			end
		end
	
		for i,v in ipairs(remcrowd) do
			table.remove(crowds, v)
		end
		    
		for i,v in ipairs(remShot) do
			table.remove(cam.shots, v)
		end
		
		for i,v in ipairs(crowds) do
			v.y = v.y + dt
		end
		
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
		love.graphics.setColor( 0, 0, 0, 255)
		love.graphics.rectangle("fill", 0, 0, 1025, 600)
		love.graphics.setColor( 255, 255, 255, 255)
		love.graphics.print("FPS: "..love.timer.getFPS(), 5, 0)
		love.graphics.print("EGO", 1025/2,0)
		love.graphics.setColor( 75, 75, 75, 255)
		love.graphics.rectangle("fill", 0, 35, 1025, 565)
		love.graphics.setColor( 125, 125, 125, 255)
		love.graphics.rectangle("fill", 120, 100, 800, 400)
		love.graphics.setColor(255,255,0,255)
		
		-- Draws Cam Man
		love.graphics.draw(camman, cam.x, cam.y, camrot, .33, .33, 32, 32)
		love.graphics.setColor(255,255,255,255)

		for i,v in ipairs(cam.shots) do -- Draws Pings 
			love.graphics.rectangle("fill", v.x, v.y, 2, 5)
		end
		    
		love.graphics.setColor(0,255,255,255)
		for i,v in ipairs(crowds) do       --Draws Crowds
			love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
		end
		love.graphics.draw(player, px, py, playerrot, .33, .33, 32, 32)
	end


function shoot()
	local shot = {}
	shot.x = cam.x+cam.width/5
	shot.y = cam.y
	
	table.insert(cam.shots, shot)
end

function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)

  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1

end
end