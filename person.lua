require "middleclass/middleclass"

hasSpawned = false

crowd = {}
body = {}
fixture = {}

tick = {}
dir = {}
forcex = {}
forcey = {}




person = love.graphics.newImage("media/person.png")
Person = class('Person') --this is the same as class('Person', Object) or Object:subclass('Person')
function Person:initialize(x, y)
	self.x = x
	self.y = y
	self.tick = 0
	self.dir = 0
	self.speed = 50
end
function Person:draw()
	love.graphics.draw(person, self.x, self.y, 0, .33)
end

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
			love.graphics.circle("fill", body[i]:getX(), body[i]:getY(), crowd[i]:getRadius())
			print("Spawned" .. i)
		end
		hasSpawned = true
	else
		dt = love.timer.getDelta( )

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
			end
			
			tick[i] = tick[i] - 1
			body[i]:applyForce(forcex[i], forcey[i])
			love.graphics.circle("fill", body[i]:getX(), body[i]:getY(), crowd[i]:getRadius())
		end	
	end
end

			--bodys.player.body = love.physics.newBody( world, self.x , self.y, "dynamic" )
			--bodys.player.shape = love.physics.newCircleShape( 24)
			--bodys.player.fixture = love.physics.newFixture(bodys.player.body, bodys.player.shape)
	

