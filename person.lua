require "middleclass/middleclass"

hasSpawned = false
dt = love.timer.getDelta()

crowd = {}
body = {}
fixture = {}

tick = {}
dir = {}
rot = {}
forcex = {}
forcey = {}
skin = {}

person1 = love.graphics.newImage("media/person1.png")
person2 = love.graphics.newImage("media/person2.png")
person3 = love.graphics.newImage("media/person3.png")
person4 = love.graphics.newImage("media/person4.png")
person5 = love.graphics.newImage("media/person5.png")

function draw(num)
	if hasSpawned == false then
		for i=0, num do
			randx = math.random(spxmin, spxmax)
			randy = math.random(spymin, spymax)
			crowd[i] = love.physics.newCircleShape(8)
			body[i] = love.physics.newBody( world, randx , randy, "dynamic" )
			fixture[i] = love.physics.newFixture(body[i], crowd[i])
			tick[i] = 0
			dir[i] = 0
			forcex[i] = 0
			forcey[i] = 0
			skin[i] = math.random(1,5)
			print(skin[i])
			rot[i] = 0
			love.graphics.circle("fill", body[i]:getX(), body[i]:getY(), crowd[i]:getRadius())
		end
		hasSpawned = true
	else

		love.graphics.setColor(193, 47, 14)
		for i=0, num do
			x = body[i]:getX()
			y = body[i]:getY()
			if tick[i] == 0 then
				--Find a random direction
				dir[i] = math.random(0,8)
				--Find a random tick
				tick[i] = math.random(50,100)
				--Find a random speed
				forcex[i] = math.random(-50,50)
				--Find a random speed
				forcey[i] = math.random(-50,50)
				--Find rotation
				rot[i] = math.random(0,3.14)
			end
			
			tick[i] = tick[i] - 1
			body[i]:applyForce(forcex[i], forcey[i])
			
			if skin[i] == 1 then
				skin[i] = person1
			elseif skin[i] == 2 then
				skin[i] = person2
			elseif skin[i] == 3 then
				skin[i] = person3
			elseif skin[i] == 4 then
				skin[i] = person4
			elseif skin[i] == 5 then
				skin[i] = person5
			end
			
			love.graphics.reset()
			--love.graphics.circle("fill", body[i]:getX(), body[i]:getY(), crowd[i]:getRadius())
			love.graphics.draw(skin[i], body[i]:getX(), body[i]:getY(), rot[i], 1, 1, 8, 8)
		end	
	end
end

			--bodys.player.body = love.physics.newBody( world, self.x , self.y, "dynamic" )
			--bodys.player.shape = love.physics.newCircleShape( 24)
			--bodys.player.fixture = love.physics.newFixture(bodys.player.body, bodys.player.shape)
	

