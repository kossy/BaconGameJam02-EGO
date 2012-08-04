function love.load()
	font14 = love.graphics.newFont("Fipps.otf", 14)	
	font20 = love.graphics.newFont("Fipps.otf", 20)
	image = love.graphics.newImage("Buttion.png")
end 


function love.draw()
	love.graphics.setFont(font14)
	love.graphics.print("EGO Ver 0.2" , 10, 10)
	love.graphics.draw(image, 600, 100)
	love.graphics.setFont(font20)
	love.graphics.print("Start Press S", 650, 130)
end