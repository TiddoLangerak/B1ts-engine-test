local tileWidth = 100;
local tileHeight = tileWidth / 2;
local tiles = {};
local nrOfTilesX = display.contentWidth / tileWidth + 1
local nrOfTilesY = 2 * display.contentHeight / tileHeight + 1
for i = 1, nrOfTilesX do 
	tiles[i] = {}
	for t = 1, nrOfTilesY do
		tiles[i][t] = display.newImage("assets/tile.png")
		tiles[i][t].width = tileWidth;
		tiles[i][t].height = tileHeight
		tiles[i][t]:setReferencePoint(display.TopLeftReferencePoint)
		local xOffset = (t % 2) * -tileWidth/2
		tiles[i][t].x = xOffset + (i-1) * tileWidth;
		tiles[i][t].y = -tileHeight/2 + ((t-1) * tileHeight)/2;
	end
end

local pirate = display.newImage("assets/pirate.png")
pirate.width = 50
pirate.height = 55
pirate.x = display.contentWidth / 2
pirate.y = display.contentHeight / 2
function pirate:touch( event )
	if event.phase == "began" then
		local dx = pirate.x - event.x
		local dy = pirate.y - event.y
		local distance = math.sqrt(dx*dx + dy*dy)
		local speed = 1
		transition.to(pirate, {time = distance/speed, x=event.x, y = event.y})
	end
end
Runtime:addEventListener("touch", pirate)
