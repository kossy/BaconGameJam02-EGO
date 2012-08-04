function Version()
	love.graphics.print("Ver 0.10" , 10, 0)
	love.graphics.print("Made by Nonameghost & Kossy" , 655, 565)
end
function back()
	love.graphics.setFont(font20)
	love.graphics.print("Back (BackSpace)",  10, 5)
	function love.keypressed(key)
		if key == "backspace" then
			mode = "Start"
			print ("GAME: Mode Reset to Start")
		end
	end
end 
function music(track)
	if music_toggle == "1" then
		if track == "1" then 
			source = love.audio.newSource( "media/song1.mp3", mp3)
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