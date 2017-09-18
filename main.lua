-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--Load Sprite Sheets
local sheetInfo = require("sprites.lampion")

local sheet = graphics.newImageSheet( "assets/img/lampion.png", sheetInfo:getSheet() )


--Initialize Variables

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

local runnerLampiao = {
		    { 
		    	name="paradoRigth", 
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
		    	time=500
		    },
			{ 
		    	name="paradoLeft", 
		    	frames={ 
		    		sheetInfo:getFrameIndex("o1"),
                    sheetInfo:getFrameIndex("o2"),
		    		sheetInfo:getFrameIndex("o3"),
		    		sheetInfo:getFrameIndex("o4"),
		    		sheetInfo:getFrameIndex("o5"),
                    sheetInfo:getFrameIndex("o6"),
		    		sheetInfo:getFrameIndex("o7"),
		    		sheetInfo:getFrameIndex("o8"),
		    		sheetInfo:getFrameIndex("o9"),
		    	}, 
		    	time=500
		    },
		    { 
		    	name="andandoRigth", 
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
		    	}, 
		    	time=500
		    },
			{ 
		    	name="andandoLeft", 
		    	frames={
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
		    	time=500
		    },
}

local sequenceLamp = {
    { name= "paradoLeft", start = 29, count = 9, time = 1000 , loopCount = 0},--loopDirection = "forward"},
	{ name= "paradoRigth", start = 38, count = 9, time = 1000 , loopCount = 0},--loopDirection = "forward"},
    { name= "andandoRight", start= 1, count = 14, time =1000, loopCount = 0}, --loopDirection= "forward" },
    { name= "andandoLeft", start= 15, count = 14, time =1000, loopCount = 0},-- loopDirection= "forward" }

}



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
solo.y = h - 50
physics.addBody(solo, "static",  {friction=1})

lampiao = display.newSprite( backGroup, sheet, sequenceLamp)
lampiao.x = display.contentCenterX - 100
lampiao.y = 0
physics.addBody( lampiao, "dynamic", {radius=1, bounce=0.1, friction=2, isSensor=false} )
lampiao: setSequence("parado")
lampiao.myName = "lampiao"

--lampiao: play()


-- Display lives and score
livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end

-- set game buttons
-- rigth
buttons[1] = display.newImage("assets/buttons/lineLight22.png")
buttons[1].x = -100
buttons[1].y = 680
buttons[1].alpha = .2
buttons[1].myName = "buttonLeft"

-- left
buttons[2] = display.newImage("assets/buttons/lineLight23.png")
buttons[2].x = 10
buttons[2].y = 680
buttons[2].alpha = .2
buttons[2].myName = "buttonRight"

local touchFunction = function(e)
    local eventName = e.phase
	local direction = e.target.myName

    if eventName == "began" or eventName == "moved" then
        if direction == "buttonRight" then
			lampiao: setSequence("andandoRight")
			lampiao.myName = "lampiao"

			eixoX = 5
            eixoY = h - 21
            print("Rigth")
        elseif direction == "buttonLeft" then
			lampiao: setSequence("andandoLeft")
			lampiao.myName = "lampiao"

            eixoX = -5
            eixoY = h - 21
            print("Left")
        end
    else

		if e.target.myName == "buttonRight" then
			lampiao:setSequence("paradoRigth")
		elseif e.target.myName == "buttonLeft" then
			lampiao:setSequence("paradoLeft")
		end

        eixoX = 0
        eixoY = 0
    end
end

local j=1

for j=1, #buttons do 
	buttons[j]:addEventListener("touch", touchFunction)
end


local update = function()
	lampiao.x = lampiao.x + eixoX
	lampiao.y = h - 500

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

	lampiao: play()	

end

Runtime:addEventListener("enterFrame", update)
