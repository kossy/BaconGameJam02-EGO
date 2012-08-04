require "functions/functions"
require "game"
function love.load()
	love.graphics.setBackgroundColor( 204, 102, 0)
	font14 = love.graphics.newFont("media/Fipps.otf", 14)	
	font20 = love.graphics.newFont("media/Fipps.otf", 20)
	font30 = love.graphics.newFont("media/Fipps.otf", 30)
	font50 = love.graphics.newFont("media/Fipps.otf", 50)
	Buttion = love.graphics.newImage("media/Buttion.png")
	Key = love.graphics.newImage("media/Key.png")
	mode = "Start"
	print ("LOAD: Fonts and Reseting Variables ...Done")
end 


function love.draw()
	love.graphics.setFont(font14)
	Version()
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 130, 0)
	down = love.mouse.isDown("l")
	if  mode == "Start"  then
		love.graphics.setFont(font50)
		love.graphics.print("EGO", 430, 100)
		love.graphics.setFont(font20)
		love.graphics.print("Start , Press Enter", 350, 330)
		love.graphics.print("Settings , Press T", 350, 365)		
		love.graphics.print("Help , Press H", 385, 400)
	elseif mode == NULL then
		print ("ERROR: Mode Not Set!")
	end
	
	--Key Bindings

	function love.keypressed(key)
		if mouse_x == 348 < 660 then
			print ("X LOCKED!")
		end
		if mouse_y == 344 < 370 then
			print ("Y LOCKED!")
		end
		if key == "return" or down == true and mouse_x >= 348 <= 660 and mouse_y >= 344	<= 370  then
			mode = "Game"
			print ("GAME: Mode Changed to Game")
			
		elseif key == "t" then
			mode = "Settings"
			print ("GAME: Mode Changed to Settings")

		elseif key == "h" then
			mode = "Help"
			print ("GAME: Mode Changed to Help")

		elseif key == "escape" then
			love.event.push("quit")
			print ("GAME: Quiting")
			
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
		back()
	end
	
	if mode == "Help" then
		love.graphics.clear( )
		love.graphics.setFont(font30)
		love.graphics.print("Help", 800, 5)
		love.graphics.setFont(font20)
		back()
	end
	
end