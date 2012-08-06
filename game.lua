require "person"
require "middleclass/middleclass"

function startgame()
	
	scanlines = love.graphics.newImage("media/scanlines.png")
	world = love.physics.newWorld( 0, 0)
	
	border = {}
	
	--top = love.physics.newEdgeShape( 110, 100, 930, 100 )
	border.top = {}
	border.top.body = love.physics.newBody(world, 520, 95, "static")
	border.top.shape = love.physics.newRectangleShape(820, 10)
	border.top.fixture = love.physics.newFixture(border.top.body, border.top.shape, 10) -- A higher density gives it more mass.

	--bottom = love.physics.newEdgeShape( 110, 500, 930, 500 )
	border.bottom = {}
	border.bottom.body = love.physics.newBody(world, 520, 505, "static")
	border.bottom.shape = love.physics.newRectangleShape(820, 10)
	border.bottom.fixture = love.physics.newFixture(border.bottom.body, border.bottom.shape, 10) -- A higher density gives it more mass.
	
	--left = love.physics.newEdgeShape( 120, 90, 120, 510 )
	border.left = {}
	border.left.body = love.physics.newBody(world, 115, 300, "static")
	border.left.shape = love.physics.newRectangleShape(10, 410)
	border.left.fixture = love.physics.newFixture(border.left.body, border.left.shape, 10) -- A higher density gives it more mass.
	
	--right = love.physics.newEdgeShape( 920, 90, 920, 510 )
	border.right = {}
	border.right.body = love.physics.newBody(world, 925, 300, "static")
	border.right.shape = love.physics.newRectangleShape(10, 410)
	border.right.fixture = love.physics.newFixture(border.right.body, border.right.shape, 10) -- A higher density gives it more mass.

	player = love.graphics.newImage("media/player.png")
	px = 1025/2
	py = 600/2
	pspeed = 200
	playerrot = 0
	pbody = love.physics.newBody( world, px , py, "dynamic" )
	pshape = love.physics.newCircleShape(12)
	pfix = love.physics.newFixture(pbody, pshape, 3)
	
	cameraman = love.graphics.newImage("media/cameraman.png")
	funnel = love.graphics.newImage("media/cam_funnel.png")
	cx = 1025/2
	cy = 600/2
	cspeed = 200
	camrot = 0
	cbody = love.physics.newBody( world, cx , cy, "dynamic" )
	cshape = love.physics.newCircleShape(12)
	cfix = love.physics.newFixture(cbody, cshape, 3)
	
	camx = cbody:getX()
	camy = cbody:getY()
	
	funnelrot = -3.1
	
	tbody = love.physics.newBody( world, cx , cy, "dynamic" )
	--tshape = love.physics.newRectangleShape( camx, camy, 10, 10, funnelrot )
	tshape =  love.physics.newPolygonShape(camx, camy + 24, camx - 10, camy + 48, camx + 10, camx + 48)
	tfix = love.physics.newFixture(tbody, tshape, 3)
	
	ymax = 490
	ymin = 100
	xmax = 910
	xmin = 120
	
	spymax = 450
	spymin = 150
	spxmax = 870
	spxmin = 150
	
	bodies = 500
	
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	
	pings = {} --Hods Fired Pings so they can be easily managed
           
        function ping()
			ping = {}
            camx = cbody:getX()
            camy = cbody:getY()
            ping.x = camx + (40/2)     -- Where the ping fire from x
            ping.y = camy       -- Where the ping fire from y
            table.insert(pings, ping)
            print("Ping Loaded")
        end
                   
        function love.keyreleased(key)
            if (key == " ") then
				--ping()
				print("Ping")
            end
        end

	
	function love.update(dt)
		world:update(dt)
		if love.keyboard.isDown("up") and love.keyboard.isDown("left") then
			playerrot = -0.785398163
			--pbody:setLinearVelocity( 0, 0 )
			pbody:applyForce( -1*(pspeed/2), -1*(pspeed/2))
		elseif love.keyboard.isDown("up") and love.keyboard.isDown("right") then
			playerrot = 0.785398163
			--pbody:setLinearVelocity( 0, 0 )
			pbody:applyForce( pspeed/2, -1*(pspeed/2))
		elseif love.keyboard.isDown("down") and love.keyboard.isDown("left") then
			playerrot = -2.35619449
			--pbody:setLinearVelocity( 0, 0 )
			pbody:applyForce( -1*(pspeed/2), pspeed/2)
				
		elseif love.keyboard.isDown("down") and love.keyboard.isDown("right") then

			playerrot = 2.35619449
			--pbody:setLinearVelocity( 0, 0 )
			pbody:applyForce( pspeed/2, pspeed/2)
		else
			if love.keyboard.isDown("left") then
				playerrot =(-1.57079633)
				--pbody:setLinearVelocity( 0, 0 )
				pbody:applyForce( -1*(pspeed), 0)
				
		   elseif love.keyboard.isDown("right") then
				playerrot =(1.57079633)
				--pbody:setLinearVelocity( 0, 0 )
				pbody:applyForce( pspeed, 0)

		   elseif love.keyboard.isDown("up") then
				playerrot =(0)
				--pbody:setLinearVelocity( 0, 0 )
				pbody:applyForce( 0, -1*(pspeed))
		   elseif love.keyboard.isDown("down") then
				playerrot =(3.14159265)
				--pbody:setLinearVelocity( 0, 0 )
				pbody:applyForce( 0, pspeed)
				
			
		   end	   			
					
			if love.keyboard.isDown("k") then
				funnelrot = funnelrot + 0.1
			end
			
		    if love.keyboard.isDown("l") then
				funnelrot = funnelrot - 0.1
			end
		end
	end
	function love.draw()
	
	  --love.graphics.setColor( 0, 0, 0, 255)
	  --love.graphics.rectangle("fill", 0, 0, 1025, 600)
	  love.graphics.setColor( 255, 255, 255, 255)
	  
	  love.graphics.setColor( 75, 75, 75, 255)
	  love.graphics.rectangle("fill", 0, 35, 1025, 565)
	  
	  love.graphics.setColor( 125, 125, 125, 255)
	  love.graphics.rectangle("fill", 120, 100, 800, 400)
	  
	  love.graphics.setColor( 0, 0, 0, 255)
	  love.graphics.polygon("fill", border.top.body:getWorldPoints(border.top.shape:getPoints()))
	  love.graphics.polygon("fill", border.bottom.body:getWorldPoints(border.bottom.shape:getPoints()))
	  love.graphics.polygon("fill", border.left.body:getWorldPoints(border.left.shape:getPoints()))
	  love.graphics.polygon("fill", border.right.body:getWorldPoints(border.right.shape:getPoints()))
	  	 
	  love.graphics.reset()
	  draw(bodies)
	  
	  love.graphics.setColor( 0, 255, 0, 255)
	  --pbody:setX(px)
	  --pbody:setY(py)
	  love.graphics.circle("fill", pbody:getX(), pbody:getY(), pshape:getRadius())
	  love.graphics.reset()
	  love.graphics.draw(player, pbody:getX(), pbody:getY(), playerrot, 1, 1, 8, 8)
	  
	  love.graphics.setColor( 0, 0, 255, 255)
	  love.graphics.circle("fill", cbody:getX(), cbody:getY(), cshape:getRadius())
	  love.graphics.reset()
	  
	  love.graphics.draw(cameraman, cbody:getX(), cbody:getY(), camrot, 1, 1, 10, 8)
	  love.graphics.polygon('fill', 100, 100, 200, 100, 150, 200)
	  love.graphics.draw(funnel, cbody:getX() + 4, cbody:getY() - 12, funnelrot, 1, 1, 10, 8)
	  print(funnelrot)
	  
	  love.graphics.draw(scanlines, 0, 0)
	  love.graphics.print("FPS: "..love.timer.getFPS(), 5, 0)
	  love.graphics.print("EGO", 1025/2,0)
	  love.graphics.print( "Mouse X: ".. love.mouse.getX() .. " Mouse Y: " .. love.mouse.getY(), 600, 0)

	  
	end

end