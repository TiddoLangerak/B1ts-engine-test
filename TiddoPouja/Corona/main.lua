--Constants
local tileWidth = 100;
local tileHeight = tileWidth / 2;
local nrOfTilesX = display.contentWidth / tileWidth + 1
local nrOfTilesY = 2 * display.contentHeight / tileHeight + 1

local tiles = {};
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

local tavern = display.newImage("assets/tavern.png")
tavern.width = 100
tavern.height = 102
tavern:setReferencePoint(display.BottomRightReferencePoint);
tavern.y = 250
tavern.x = 200
tavern.alpha = 0.1

function buildTavern(obj) 
	if obj.x < tavern.x and obj.x > tavern.x - tavern.width and obj.y < tavern.y and obj.y > tavern.y - tavern.height then
		transition.to(tavern, {time = 500, alpha = 1})
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
		transition.to(pirate, {time = distance/speed, x=event.x, y = event.y, onComplete = buildTavern})
	end
end
Runtime:addEventListener("touch", pirate)
