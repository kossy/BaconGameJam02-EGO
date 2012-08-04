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
function dofile (filename)
      local f = assert(loadfile(filename))
      return f()
    end