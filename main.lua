require "functions/functions"
require "game"
function love.load()
	font14 = love.graphics.newFont("media/Fipps.otf", 14)	
	font20 = love.graphics.newFont("media/Fipps.otf", 20)
	font30 = love.graphics.newFont("media/Fipps.otf", 30)
	image = love.graphics.newImage("media/Buttion.png")
	mode = "Start"
end 


function love.draw()
	love.graphics.setFont(font14)
	Version()
	
	if  mode == "Start"  then
  --	love.graphics.draw(image, 600, 100)
		love.graphics.setFont(font20)
		love.graphics.print("Start , Press Enter", 350, 330)
		love.graphics.print("Help , Press H", 385, 400)
		
	elseif Smode ~= "Start" and mode ~= "Game" and  mode ~= "Help" then
		love.graphics.print("Mode Not Set", 650, 130)
	end
	
	--Key Bindings

	function love.keypressed(key)
		if key == "return" then
			mode = "Game"
			
		elseif key == "t" then
			mode = "Settings"

		elseif key == "h" then
			mode = "Help"

		elseif key == "escape" then
			love.event.push("quit")
			
		end
	end



	--Mode Setup Code
	if mode == "Game" then
		love.graphics.clear( )
		test()
	end
	if mode == "Settings" then
		love.graphics.clear( )
		love.graphics.setFont(font30)
		love.graphics.print("Settings", 700, 5)
		love.graphics.setFont(font20)
		love.graphics.print("Back (BackSpace)",  10, 15)
		function love.keypressed(key)
			if key == "backspace" then
				mode = "Start"
			end
		end
	end
	
	if mode == "Help" then
		love.graphics.clear( )
		love.graphics.setFont(font30)
		love.graphics.print("Help", 440, 5)
		love.graphics.setFont(font20)
		love.graphics.print("Back (BackSpace)",  10, 15)
		function love.keypressed(key)
			if key == "backspace" then
				mode = "Start"
			end
		end
	end
	
end