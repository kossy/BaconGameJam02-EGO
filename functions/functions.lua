function Version()
	love.graphics.print("Ver 0.10" , 10, 0)
	love.graphics.print("Made by Nonameghost & Kossy" , 655, 565)
end

function back()
	love.graphics.setFont(font20)
	love.graphics.print("Back",  10, 5)
	
	if love.mouse.isDown("l") and mouse_x >= 8 and mouse_x <= 90 and mouse_y >= 19 and mouse_y  <= 46 then
		mode = "Start"
	end
	
	print ("GAME: Mode Reset to Start")
	
end 

function music(track)
	if music_toggle == "1" then
		if track == "1" then 
			source = love.audio.newSource( "media/song1.mp3", mp3)
			love.audio.play(source)
		end
		if track == "1" then 
			source = love.audio.newSource( "media/song2.mp3", mp3)
			love.audio.play(source)
		end
	end
end

function save(slot)

end

function egg_console() 
fontc14 = love.graphics.newFont("media/console.ttf", 14)
love.graphics.clear( )
love.graphics.setBackgroundColor( 0, 0, 0)
love.graphics.setColor(1, 255, 0)
end