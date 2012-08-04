require "functions/functions"
require "game"
function love.load()
	love.graphics.setBackgroundColor( 204, 102, 0)
	font14 = love.graphics.newFont("media/Fipps.otf", 14)	
	font20 = love.graphics.newFont("media/Fipps.otf", 20)
	font30 = love.graphics.newFont("media/Fipps.otf", 30)
	font70 = love.graphics.newFont("media/Fipps.otf", 70)
	Buttion = love.graphics.newImage("media/Buttion.png")
	Key = love.graphics.newImage("media/Key.png")
	mode = "Start"
	savetime = 0 -- Current OS time
	showtext = true -- Show text or hide
	music_toggle = "1"
	love.audio.setVolume(1)
	down = love.mouse.isDown("l")
	print ("LOAD: Fonts and Reseting Variables ...Done")
	music("1")

end 


function love.draw()
	love.graphics.setFont(font14)
	downf3 = love.keyboard.isDown("f3")
	downegg = love.keyboard.isDown("`")
	if downf3 == true then
		if downegg == true then
			egg_console()
			text = "on"
		end
		if text == "on" then
			love.graphics.print("Microsoft Windows [Version 6.1.7600]", 15, 474)
            love.graphics.print("Copyright <c> 2012 Microsoft Corporation. All rights reserved.", 15 , 510)
            love.graphics.print("C:\Users\EGO", 15, 550)
		end
		Version()
		mouse_x = love.mouse.getX()
		mouse_y = love.mouse.getY()
		love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 130, 0)
		love.graphics.print("FPS: "..love.timer.getFPS(), 460, 0)
	end
	if  mode == "Start"  then
		love.graphics.setFont(font70)
		love.graphics.print("EGO", 400, 100)
		love.graphics.setFont(font20)
		love.graphics.print("Settings , Press T", 350, 365)		
		love.graphics.print("Help , Press H", 385, 400)
		love.graphics.print("Start , Press Enter", 350, 330)
		
		--Flicker Timer
	--	if savetime == 0 or savetime + 1 <= os.time() then
	--		savetime = os.time()
		
	--		if showtext == true then
	--			love.graphics.setColor(204, 102, 0)
	--			love.graphics.print("Start , Press Enter", 350, 330)
	--			print("Orange")
	--		else 
	--			love.graphics.setColor(255, 255, 255)
	--			love.graphics.print("Start , Press Enter", 350, 330)
	--			print("White")
	--		end 
	--	
	--		love.graphics.setColor(255, 255, 255)
	--		showtext = not showtext
	--		print(showtext)
	--	end
	
	elseif mode == NULL then
		print ("ERROR: Mode Not Set!")
	end
	
	--Key Bindings
	
	function love.keypressed(key)

		if key == "return" then
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
	

		
	
	--Mouse
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()	
	if love.mouse.isDown("l") and mouse_x >= 347 and mouse_x <= 658 and mouse_y >= 344 and mouse_y  <= 360 then
		print(mouse_x)
		print(mouse_y)
	end

	--Mode Setup Code
	if mode == "Game" then
		love.graphics.clear()
		startgame()	
	end
	
	if mode == "Settings" then
		love.graphics.clear( )
		love.graphics.setFont(font30)
		love.graphics.print("Settings", 700, 5)
		love.graphics.setFont(font20)
		if music_toggle == "0" then
			love.graphics.print("Un-Mute Music , Press M", 43, 74)
		else
			love.graphics.print("Mute Music , Press M", 43, 74)
		end
		love.graphics.print("Toggle Fullscreen , Press F", 43, 150)
		love.graphics.print("Music Volume " ..love.audio.getVolume().. " Press + -", 43, 111)
		love.graphics.setFont(font20)
		love.graphics.print("Back (BackSpace)",  10, 5)
		
		function love.keypressed(key)
			if key == "m"  and music_toggle == "1" then
				music_toggle = "0"
				love.audio.stop()
				key = "0"
				print ("GAME: Music Muted")	
			end
			if key == "m"  and music_toggle == "0" then
				music_toggle = "1"
				music("1")
				key = "0"
				print ("GAME: Music Un-Muted")	
			end
			if key == "backspace" then
				mode = "Start"
				print ("GAME: Mode Reset to Start")
			end
			if key == "-" then
				volume = love.audio.getVolume()
				love.audio.setVolume(volume - 0.1)
				print ("GAME: Game Volume Decreased")
			end
			if key == "+" then
				volume = love.audio.getVolume()
				love.audio.setVolume(volume + 0.1)
				print ("GAME: Game Volume Increased")
			end
			if key == "f" then
				love.graphics.toggleFullscreen( )
				print ("GAME: FullScreen Toggled")
			end
		end	
	end
	
	if mode == "Help" then
		love.graphics.clear( )
		love.graphics.setFont(font30)
		love.graphics.print("Help", 800, 5)
		love.graphics.setFont(font20)
		back()
	end
	
end