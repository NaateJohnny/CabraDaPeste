-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--Load Sprite Sheets
local sheetInfo = require("sprites.lampion")

local sheet = graphics.newImageSheet( "assets/img/lampion.png", sheetInfo:getSheet() )




--Initialize Variables
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
local comecou = false
local velocidade = 6
local fundo = {}
local fx = {120,200}


local lives = 3
local score = 0
local died = false

local buttons = {}

local lampiao
local gameLoopTimer
local livesText
local scoreText
local physics

local w = display.contentWidth -- variable of width
local h = display.contentHeight -- variable of higth

local eixoX = w - 5
local eixoY = h

local sequenciaLampiao = {
		    { 
		    	name="parado", 
		    	frames={ 
		    		sheetInfo:getFrameIndex("p1"),
                    sheetInfo:getFrameIndex("p2"),
		    		sheetInfo:getFrameIndex("p3"),
		    		sheetInfo:getFrameIndex("p4"),
		    		sheetInfo:getFrameIndex("p5"),
                    sheetInfo:getFrameIndex("p6"),
		    		sheetInfo:getFrameIndex("p7"),
		    		sheetInfo:getFrameIndex("p8"),
		    		sheetInfo:getFrameIndex("p9"),
		    	}, 
		    	time=200
		    },
		    { 
		    	name="andando", 
		    	frames={ 
		    		sheetInfo:getFrameIndex("m1"),
		    		sheetInfo:getFrameIndex("m2"),
		    		sheetInfo:getFrameIndex("m3"),
		    		sheetInfo:getFrameIndex("m4"),
                    sheetInfo:getFrameIndex("m5"),
		    		sheetInfo:getFrameIndex("m6"),
		    		sheetInfo:getFrameIndex("m7"),
		    		sheetInfo:getFrameIndex("m8"),
                    sheetInfo:getFrameIndex("m9"),
		    		sheetInfo:getFrameIndex("m10"),
		    		sheetInfo:getFrameIndex("m11"),
		    		sheetInfo:getFrameIndex("m12"),
                    sheetInfo:getFrameIndex("m13"),
		    		sheetInfo:getFrameIndex("m14"),
                    sheetInfo:getFrameIndex("n1"),
		    		sheetInfo:getFrameIndex("n2"),
		    		sheetInfo:getFrameIndex("n3"),
		    		sheetInfo:getFrameIndex("n4"),
                    sheetInfo:getFrameIndex("n5"),
		    		sheetInfo:getFrameIndex("n6"),
		    		sheetInfo:getFrameIndex("n7"),
		    		sheetInfo:getFrameIndex("n8"),
                    sheetInfo:getFrameIndex("n9"),
		    		sheetInfo:getFrameIndex("n10"),
		    		sheetInfo:getFrameIndex("n11"),
		    		sheetInfo:getFrameIndex("n12"),
                    sheetInfo:getFrameIndex("n13"),
		    		sheetInfo:getFrameIndex("n14"),
		    	}, 
		    	time=400
		    },
		}

function scene:create( event )
	local group = self.view

	lampiao = display.newSprite( sheet , sequenciaLampiao)
	lampiao.anchorX = 0.5
	lampiao.anchorY = 0.5
	lampiao.x = 10
	lampiao.y = 94
	lampiao:scale(0.5,0.5)
	lampiao.nome = "lampiao"
	lampiao:setSequence("parado")
	lampiao:play()
	
	group:insert( lampiao )


end

-- Set up display groups
local backGroup = display.newGroup()  -- Display group for the background image
local mainGroup = display.newGroup()  -- Display group for the Lampiao etc.
local uiGroup = display.newGroup()    -- Display group for UI objects like the score


--Physics the game
physics = require("physics")
physics.start()

--local player = display.newRect(0, 0, 40, 40)
--player.x = w * .5
--player.y = h * .5

--Backgroud image
local background = display.newImageRect( backGroup, "assets/img/quixada.png", 1450, 696 )
background.x = display.contentCenterX
background.y = h - 510

--Solo image
local solo = display.newImageRect( backGroup, "assets/img/solo.png", 1450, 320 )
solo.x = display.contentCenterX
solo.y = h - 01
physics.addBody(solo, "static",  {friction=1})



-- Display lives and score
--livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
--scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

--local function updateText()
    --livesText.text = "Lives: " .. lives
    --scoreText.text = "Score: " .. score
--end

-- set game buttons
-- rigth
buttons[1] = display.newImage("assets/buttons/lineLight22.png")
buttons[1].x = -100
buttons[1].y = 700
buttons[1].myName = "buttonRight"

-- left
buttons[2] = display.newImage("assets/buttons/lineLight22.png")
buttons[2].x = 10
buttons[2].y = 700
buttons[2].rotation = 180
buttons[2].myName = "buttonLeft"

local touchFunction = function(e)
    local eventName = e.phase
	local direction = e.target.myName

    if eventName == "began" or eventName == "moved" then
        if direction == "buttonRight" then
            eixoX = -5
            eixoY = h - 21
            print("rigth")
        elseif direction == "buttonLeft" then
            eixoX = 5
            eixoY = h - 21
            print("left")
        end
    else
        eixoX = 0
        eixoY = h - 21
    end
end

local j=1

local j=1

for j=1, #buttons do 
	buttons[j]:addEventListener("touch", touchFunction)
end


local update = function()
	lampiao.x = lampiao.x + eixoX
	lampiao.y = lampiao.y + eixoY

	if lampiao.x <= lampiao.width * .1 then 
		lampiao.x = lampiao.width * .1
	elseif lampiao.x >= w - lampiao.width * .1 then 
		lampiao.x = w - lampiao.width * .1
	end

	if lampiao.y <= lampiao.height * 4.5 then
		lampiao.y = lampiao.height * 4.5
	elseif lampiao.y >= h - lampiao.height * 4.5 then 
		lampiao.y = h - lampiao.height * 4.5
	end 
end

Runtime:addEventListener("enterFrame", update)

function toque( event )
 if(comecou==false and caindo==false and event.phase == "began") then
 	comecou = true
 	lampiao:setSequence("andando")
 	lampiao:play()
 end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

Runtime:addEventListener( "touch", toque )


return scene