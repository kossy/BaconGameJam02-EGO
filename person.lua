require "middleclass/middleclass"

hasSpawned = false
crowd = {}
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

function spawnCrowd(num)
	if hasSpawned == false then
		for i=0, num do
			randx = math.random(spxmin, spxmax)
			randy = math.random(spymin, spymax)
			crowd[i] = Person:new(randx,randy)
			crowd[i]:draw()
		end
		hasSpawned = true
	else
		dt = love.timer.getDelta( )
		for i=0, num do
			x = crowd[i].x
			y = crowd[i].y
			if crowd[i].tick == 0 then
				--Find a random direction
				crowd[i].dir = math.random(0,16)
				print(crowd[i].dir)
				--Find a random tick
				crowd[i].tick = math.random(50,100)
			end
			
			--move in random direction
			if crowd[i].dir == 0 then
				--crowd[i].dir == "idle"
				
			elseif crowd[i].dir == 1 or crowd[i].dir == 16 then 
				--crowd[i].dir == "up"
				if y < ymin then
				else
					--playerrot = -0.785398163
					y = y - (crowd[i].speed *dt)
				end
			elseif crowd[i].dir == 2 or crowd[i].dir == 15 then
				--crowd[i].dir == "up-right"
				if y < ymin or x > xmax then
				else
					--playerrot = 0.785398163
					y = y - (crowd[i].speed *dt)
					x = x + (crowd[i].speed *dt)
				end
			elseif crowd[i].dir == 3 or crowd[i].dir == 14 then
				--crowd[i].dir == "right"
				if x > xmax then
				else
					--playerrot = -0.785398163
					x = x + (crowd[i].speed *dt)
				end				
			elseif crowd[i].dir == 4 or crowd[i].dir == 13 then 
				--crowd[i].dir == "down-right"
				if y <= ymax or x >= xmax then
				else
					--playerrot = -0.785398163
					y = y + (crowd[i].speed *dt)
					x = x + (crowd[i].speed *dt)
				end
			elseif crowd[i].dir == 5 or crowd[i].dir == 12 then
				--crowd[i].dir == "down"
				if y > ymax then
				else
					--playerrot = -0.785398163
					y = y + (crowd[i].speed *dt)
				end
			elseif crowd[i].dir == 6 or crowd[i].dir == 11 then
				--crowd[i].dir == "down-left"
				if y > ymax or x < xmin then
				else
					--playerrot = -0.785398163
					y = y + (crowd[i].speed *dt)
					x = x - (crowd[i].speed *dt)
				end
			elseif crowd[i].dir == 7 or crowd[i].dir == 10 then
				--crowd[i].dir == "left"
				if x < xmin then
				else
					--playerrot = -0.785398163
					x = x - (crowd[i].speed *dt)
				end				
			elseif crowd[i].dir == 8 or crowd[i].dir == 9 then
				--crowd[i].dir == "up-left"
				if y < ymin or x < xmin then
				else
					--playerrot = -0.785398163
					y = y - (crowd[i].speed *dt)
					x = x - (crowd[i].speed *dt)
				end
			end
			
			crowd[i].tick = crowd[i].tick - 1
			crowd[i].x = x
			crowd[i].y = y
			crowd[i]:draw()
		end
	end
end

--function updateCrowd(num)
	--for i=0, num do
		--crowd[i]:draw()
	--end
--end
	
		
	