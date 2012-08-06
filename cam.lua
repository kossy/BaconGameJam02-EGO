require "middleclass/middleclass"

hasSpawned = false
dt = love.timer.getDelta()

cams = {}
body = {}
fixture = {}

tick = {}
dir = {}
rot = {}
forcex = {}
forcey = {}
spin = {}

cameraman = love.graphics.newImage("media/cameraman.png")
funnel = love.graphics.newImage("media/cam_funnel.png")
--cx = 1025/2
--cy = 600/2
--cspeed = 200
--camrot = 0
--cbody = love.physics.newBody( world, cx , cy, "dynamic" )
--cshape = love.physics.newCircleShape(12)
--cfix = love.physics.newFixture(cbody, cshape, 3)

--camx = cbody:getX()
--camy = cbody:getY()

--funnelrot = -3.1

--tbody = love.physics.newBody( world, cx , cy, "dynamic" )
--tshape = love.physics.newRectangleShape( camx, camy, 10, 10, funnelrot )
--tshape =  love.physics.newPolygonShape(camx, camy + 24, camx - 10, camy + 48, camx + 10, camx + 48)
--tfix = love.physics.newFixture(tbody, tshape, 3)


function drawCams(num)
	if camSpawned == false then
		for i=0, num do
			randx = math.random(spxmin, spxmax)
			randy = math.random(spymin, spymax)
			cams[i] = love.physics.newCircleShape(8)
			body[i] = love.physics.newBody( world, randx , randy, "dynamic" )
			fixture[i] = love.physics.newFixture(body[i], cams[i])
			tick[i] = 15
			dir[i] = 0
			rot[i] = math.random(-3.14,3.14)
			--spin[i] = 0
			love.graphics.circle("fill", body[i]:getX(), body[i]:getY(), cams[i]:getRadius())
		end
		camSpawned = true
	else

		love.graphics.setColor(193, 47, 14)
		for i=0, num do
			x = body[i]:getX()
			y = body[i]:getY()
			if tick[i] == 0 then
				--Find a random direction
				--dir[i] = math.random(0,8)
				--Find a random tick
				tick[i] = 15
				--Find a random speed
				--forcex[i] = math.random(-25,25)
				--Find a random speed
				--forcey[i] = math.random(-25,25)
				--Find rotation
				--rot[i] = rot[i] + math.random(0,1.57)
				--Find Spin
				--spin[i] = math.random(0,1)
				randx = math.random(spxmin, spxmax)
				randy = math.random(spymin, spymax)
				rot[i] = math.random(-3.14,3.14)
					
			end
			
			--if spin[i] == 0 then
				--rot[i] = rot[i] - .05
			--elseif spin[i] == 1 then
				--rot[i] = rot[i] + .05
			--end
			
			tick[i] = tick[i] - 1
			--body[i]:applyForce(forcex[i], forcey[i])
			
			love.graphics.reset()
			--love.graphics.circle("fill", body[i]:getX(), body[i]:getY(), crowd[i]:getRadius())
			love.graphics.draw(cameraman, body[i]:getX(), body[i]:getY(), rot[i], 1, 1, 10, 8)
			love.graphics.draw(funnel, body[i]:getX() , body[i]:getY() - 12, rot[i], 1, 1, 10, 8)
		end	
	end
end

	

