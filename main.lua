-- Loading Required Files
require "functions/functions"
require "game"

function love.load()
	
	--Setting up Graphics
	love.graphics.setBackgroundColor( 0, 0, 0)	-- Setting Bg Colour to black	
	love.graphics.setColor(1, 255, 0)	
	
	--Setting up fonts and sizes
	font14 = love.graphics.newFont("media/Fipps.otf", 14)	
	font20 = love.graphics.newFont("media/Fipps.otf", 20)
	font30 = love.graphics.newFont("media/Fipps.otf", 30)
	font70 = love.graphics.newFont("media/Fipps.otf", 70)
	fontnormal20 = love.graphics.newFont("media/PIXEARG.TTF", 20)
	fontbold20 = love.graphics.newFont("media/PIXEAB.TTF", 20)
	
	-- Assigning Varibles to Media
	Buttion = love.graphics.newImage("media/Buttion.png")
	Key = love.graphics.newImage("media/Key.png")
	scanlines = love.graphics.newImage("media/scanlines.png")
	
	-- Assigning Default Values for Variables
	mode = "Start"
	savetime = 0 -- Current OS time
	showtext = true -- Show text or hide
	music_toggle = "1"
	love.audio.setVolume(0.5) 
	down = love.mouse.isDown("l")
	print ("LOAD: Fonts and Reseting Variables ...Done") --Showing message that everythings been loaded 
	music("2") -- Plays Track2 on loop

end 


function love.draw()
	
	--Setting up Font Size
	love.graphics.setFont(font14)
	
	-- F3 Enables a dev view
	downf3 = love.keyboard.isDown("f3")
	if downf3 == true then
		mouse_x = love.mouse.getX()
		mouse_y = love.mouse.getY()
		
		love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 130, 0)
		love.graphics.print("FPS: "..love.timer.getFPS(), 460, 0)
	end
	
		-- Setting Up Menu Graphics
	if  mode == "Start"  then
	
		love.graphics.rectangle("fill", 316, 70, 371, 435) 
		love.graphics.setColor(0, 0, 0)
		
		love.graphics.rectangle("fill", 321, 75, 361, 425) 
		love.graphics.setColor(1, 255, 0)
		
		-- Drawing Title
		love.graphics.setFont(font70)
		love.graphics.print("EGO", 400, 100)
		
		-- Drawing Menu Options
		love.graphics.setFont(font20)
		love.graphics.print("Settings", 439, 400)		
		love.graphics.print("Instructions", 407, 365)
		love.graphics.print("Insert Coin to Start", 346, 330)
		
		-- Adding Game Verson and Menu Effects
		love.graphics.setFont(font14)
		Version()
		love.graphics.draw(scanlines, 0, 0)
		

		
	--  Flicker Timer
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
		print ("ERROR: Mode Not Set!") --Showing message in console that there is no mode set
	end
	
	-- Setting Key Bindings (Mainly for users with no mouse)
	
	function love.keypressed(key)

	--	if key == "return" then
	--		mode = "Game"
	--		print ("GAME: Mode Changed to Game")
			
	--	if key == "s" then
	--		mode = "Settings"
	--		print ("GAME: Mode Changed to Settings")
	--		end
			
	--	elseif key == "h" then
	--		mode = "Help"
	--		print ("GAME: Mode Changed to Help")
	--		end
			
		if key == "escape" then
			love.event.push("quit")
			print ("GAME: Quiting")	
		end
    end
		function love.keypressed(key)
			
		if key == "h" then
			Menu_Welcome()
			print ("MODE: Mode is now Welcome")	
		end
    end		
	
	-- Setting Mouse Coords Variable
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()	
	
	-- Setting Up Mouse Click Boxes
	-- Start Buttion
	if love.mouse.isDown("l") and mouse_x >= 340 and mouse_x <= 667 and mouse_y >= 344 and mouse_y  <= 372 then
		print("MENU: Start Buttion Pressed")
		mode = "Game"
	end
	
	-- Help Buttion
	if love.mouse.isDown("l") and mouse_x >= 405 and mouse_x <= 611 and mouse_y >= 378 and mouse_y  <= 407 then
		print("MENU: Help Buttion Pressed")
		mode = "Help"
	end
	
	-- Settings Buttion
	if love.mouse.isDown("l") and mouse_x >= 436 and mouse_x <= 580 and mouse_y >= 410 and mouse_y  <= 443 then
		print("MENU: Settings Buttion Pressed")
		mode = "Settings"
	end
	
	--Mode Setup Code
	if mode == "Game" then
		love.graphics.clear()
		startgame()	
	end
	
	--Mode Settings Code
	if mode == "Settings" then
		love.graphics.clear( )
		love.graphics.setFont(font30)
		love.graphics.print("Settings", 700, 5)
		love.graphics.setFont(font20)
		if music_toggle == "0" then
			love.graphics.print("Un-Mute Music", 43, 74)
		else
			love.graphics.print("Mute Music", 43, 74)
		end
		love.graphics.print("Toggle Fullscreen", 43, 150)
		love.graphics.print("Music Volume " ..love.audio.getVolume().. " Press + -", 43, 111)
		love.graphics.setFont(font20)
		love.graphics.print("Back",  10, 5)
		
		
		
		
		mouse_down = love.mouse.isDown("l")
		
		if love.mouse.isDown("l") and mouse_x >= 8 and mouse_x <= 90 and mouse_y >= 19 and mouse_y  <= 46 then
			mode = "Start"
			print ("GAME: Mode Reset to Start")
		end
		
		--Setting Settings Mouse Click Boxes
		
		if mouse_down == true and mouse_x >= 42 and mouse_x <= 227 and mouse_y >= 87 and mouse_y  <= 115 and music_toggle == "1" then
				music_toggle = "0"
				love.audio.stop()
				mouse_down = NULL
				print ("GAME: Music Muted")	
	
		end
		
		if mouse_down == true and mouse_x >= 42 and mouse_x <= 227 and mouse_y >= 147 and mouse_y  <= 197 then
				love.graphics.toggleFullscreen( )
				print ("GAME: FullScreen Toggled")
	
		end
		
		if mouse_down == true and mouse_x >= 42 and mouse_x <= 338 and mouse_y >= 87 and mouse_y  <= 115 and music_toggle == "0" then
				music_toggle = "1"
				love.audio.stop()
				music("2")
				mouse_down = NULL
				print ("GAME: Music UN-Muted")	
	
		end
		
		mouse_down = love.mouse.isDown("l")
		
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


function Menu_Welcome()
	love.graphics.clear( )
	love.graphics.setFont(font30)
	love.graphics.print("Welcome to", 361, 30)
	love.graphics.setFont(font70)
	love.graphics.print("EGO", 400, 100)
	love.graphics.setFont(font20)
	love.graphics.print("Story:", 17, 462)
	love.graphics.print("Basic Controls:", 17, 281)
	
    love.graphics.rectangle("fill", 45, 351, 40, 40) 
    love.graphics.setColor(1, 255, 0)
	love.graphics.draw(scanlines, 0, 0)
	love.graphics.setFont(fontbold20)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("a", 55, 361)
		
	back()	
	end