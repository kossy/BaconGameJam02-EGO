require "functions/functions"
require "game"
function love.load()
	font14 = love.graphics.newFont("Fipps.otf", 14)	
	font20 = love.graphics.newFont("Fipps.otf", 20)
	image = love.graphics.newImage("Buttion.png")
	mode = "Start"
end 


function love.draw()
	love.graphics.setFont(font14)
	love.graphics.print("EGO Ver 0.2" , 10, 10)
	
	if mode == "Start"  then
  --	love.graphics.draw(image, 600, 100)
		love.graphics.setFont(font20)
		love.graphics.print("Start , Press Enter", 650, 130)

	elseif Smode ~= "Start" and mode ~= "Game" then
		love.graphics.print("Mode Not Set", 650, 130)
	end
	function love.keypressed(key)
		if key == "return" then
			mode = "Game"
		end
	end
	
	if mode == "Game" then
		test()
	end
	
end