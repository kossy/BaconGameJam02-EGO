function love.load()
	font = love.graphics.newFont("Fipps.otf", 14)
end 


function love.draw()
	love.graphics.setFont(font)
	love.graphics.print("EGO Ver 0.2" , 10, 10)
end