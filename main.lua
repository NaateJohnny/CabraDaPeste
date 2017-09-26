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

local sequenceLamp = {
    { name= "paradoLeft", start = 29, count = 9, time = 1000 , loopCount = 0},--loopDirection = "forward"},
	{ name= "paradoRight", start = 38, count = 9, time = 1000 , loopCount = 0},--loopDirection = "forward"},
    { name= "andandoRight", start= 1, count = 14, time =1000, loopCount = 0}, --loopDirection= "forward" },
    { name= "andandoLeft", start= 15, count = 14, time =1000, loopCount = 0},-- loopDirection= "forward" }

}


-- Set up display groups
local backGroup = display.newGroup()  -- Display group for the background image
local mainGroup = display.newGroup()  -- Display group for the Lampiao etc.
local ussiGroup = display.newGroup()    -- Display group for UI objects like the score


--Physics the game
physics = require("physics")
physics.start()
-- physics.setDrawMode("hybrid")

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
physics.addBody(solo, "static",  {friction=.1})

local cactu = display.newImageRect( backGroup, "assets/img/cactuSprite.png", 100, 70 )
cactu.x = display.contentCenterX - 80
cactu.y = solo.y-195
physics.addBody(cactu, "static", {friction= .1})

lampiao = display.newSprite( backGroup, sheet, sequenceLamp)
lampiao.x = solo.x - 600
lampiao.y = solo.y-195
physics.addBody( lampiao, "dynamic", {box, bounce=0.1, friction=0, isSensor=false},
{box={halfWidth=30, halfHeight=10, x=0, y=60}, isSensor=true } )
lampiao: setSequence("paradoRight")
lampiao:play()
lampiao.isFixedRotation = true
lampiao.myName = "lampiao"


--lampiao: play()


-- Display lives and score
--livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
--scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )
--[[
local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end
]]

--local function update( event )
--	updateBackgrounds()
--end
 
--function updateBackgrounds()
--background movement
--	background.x = background.x - (2)
 
--solo movement
--	solo.x = solo.x - (2)

--	if(background.x < -200) then
--		background.x = 600
--	end
 
--	solo.x = solo.x - (2)

--	if(solo.x < -200) then
--		solo.x = 600
--	end


--end
 function pular( event)
    if event.phase=="began" then
		local vx, vy = lampiao:getLinearVelocity()
		--lampiao:setLinearVelocity(vx, -250)
        lampiao:applyLinearImpulse(0, -1.2, lampiao.x, lampiao.y)
	end
end

local function andandoRight( event )

  if ( "began" == event.phase ) then
    -- audio.play( moveTrack )
    lampiao:setSequence( "andandoRight" )
	lampiao:play()
    -- start moving 		lampiao
    lampiao:applyLinearImpulse( 1, 0, lampiao.x, lampiao.y )
  elseif ( "ended" == event.phase ) then
    lampiao:setSequence( "paradoRight" )
    lampiao:play()
	--lampiao:setFrame(1)
    -- stop moving lampiao
    lampiao:setLinearVelocity( 0,0 )
  end
end

local function andandoLeft( event )
	if ( "began" == event.phase ) then
    	-- audio.play( moveTrack )
    	lampiao:setSequence( "andandoLeft" )
    	lampiao:play()
    	lampiao:applyLinearImpulse( -1, 0, lampiao.x, lampiao.y )
  	elseif ( "ended" == event.phase ) then
    	lampiao:setSequence( "paradoLeft" )
		lampiao:play()
    	--lampiao:setFrame(1)
    	lampiao:setLinearVelocity( 0,0 )
  	--[[else

		if event.target.myName == "buttonLeft" then
			lampiao:setSequence("paradoRight")
		elseif e.target.myName == "buttonLeft" then
			lampiao:setSequence("paradoLeft")
		end

        eixoX = 0
        eixoY = 0
    end]]
  end
end

--timer.performWithDelay(1, update, -1)

-- Initialize widget
		widget = require("widget")

		-- Load gamepad start
		--atk_button = widget.newButton( {
			-- The id can be used to tell you what button was pressed in your button event
		--	id = "atk_button",
			-- Size of the button
		--	width = 80,
		--	height = 80,
		--	-- This is the default button image
		--	defaultFile = "assets/img/atk_button.png",
			-- This is the pressed button image
		--	overFile = "assets/img/atk_button_on_press.png",
			-- Position of the button
		--	left = display.contentCenterX + 350,
		--	top = display.contentCenterY + 180,
			-- This tells it what function to call when you press the button
	--		onPress = atk
	--	} )

		jump_button = widget.newButton( {
			id = "jumpButton",
			width = 80,
			height = 80,
			defaultFile = "assets/buttons/lineLight23.png",
			left = 1000,
			top = 640,
			onEvent = pular
		} )

		right_button = widget.newButton( {
			id = "right_button",
			width = 80,
			height = 80,
			defaultFile = "assets/buttons/lineLight22.png",
			left = -100,
			top = 640,
			onEvent = andandoLeft
		} )

		left_button = widget.newButton( {
			id = "left_button",
			width = 80,
			height = 80,
			defaultFile = "assets/buttons/lineLight23.png",
			left = 10,
			top = 640,
			onEvent = andandoRight
		} )

		right_button.alpha = .2;
		left_button.alpha = .2;
		jump_button.alpha = .2;
		jump_button.rotation = -90;

		--uiGroup:insert( atk_button )
		--uiGroup:insert( jump_button )
		--uiGroup:insert( right_button )
		--uiGroup:insert( left_button )
		-- Load gamepad end



-- set game buttons
-- Right
--[[--buttons[1] = display.newImage("assets/buttons/lineLight22.png")
buttons[1].x = -100
buttons[1].y = 680
buttons[1].alpha = .2
buttons[1].myName = "buttonLeft"
--local buttonRight = display.newImage("assets/buttons/lineLight22.png")
buttonRight.x = -100
buttonRight.y = 680
buttonRight.alpha = .2
onPress = andandoRight

-- left
--buttons[2] = display.newImage("assets/buttons/lineLight23.png")
buttons[2].x = 10
buttons[2].y = 680
buttons[2].alpha = .2
buttons[2].myName = "buttonRight"
local buttonLeft = display.newImage("assets/buttons/lineLight23.png")
buttonLeft.x = 10
buttonLeft.y = 680
buttonLeft.alpha = .2
onPress = andandoLeft

-- jump
local buttonJump = display.newImage("assets/buttons/lineLight23.png")
buttonJump.x = 1000
buttonJump.y = 680
buttonJump.rotation = -90
buttonJump.alpha = .2
--buttons[3].myName = "buttonJump"]]



--[[local touchFunction = function(e)
    local eventName = e.phase
	local direction = e.target.myName

    if eventName == "began" or eventName == "moved" then
        if direction == "buttonRight" then
			lampiao: setSequence("andandoRight")
			lampiao.myName = "lampiao"

			eixoX = 5
            --eixoY = h - 21
            print("Right")
        elseif direction == "buttonLeft" then
			lampiao: setSequence("andandoLeft")
			lampiao.myName = "lampiao"

            eixoX = -5
            eixoY = h - 21
            print("Left")
        end
    else

		if e.target.myName == "buttonRight" then
			lampiao:setSequence("paradoRight")
		elseif e.target.myName == "buttonLeft" then
			lampiao:setSequence("paradoLeft")
		end

        eixoX = 0
        eixoY = 0
    end
end]]



--local function pular()
--	 lampiao:applyLinearImpulse(0, -2.50, lampiao.x, lampiao.y)
--end


--local j=1

--[[for j=1, #buttons do 
	buttons[j]:addEventListener("touch", touchFunction)
end]]


--[[local update = function()
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

Runtime:addEventListener("enterFrame", update)]]

--buttonJump:addEventListener("touch", pular)
