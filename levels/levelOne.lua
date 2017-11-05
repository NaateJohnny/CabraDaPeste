------ Level One -------

display.setStatusBar(display.HiddenStatusBar)


local composer = require("composer")

local scene = composer.newScene()

function scene:create(event)

--Load Sprite Sheets
local sheetInfo = require("sprites.lampion")
local sheet = graphics.newImageSheet( "assets/img/lampion.png", sheetInfo:getSheet() )

local sheetInfo = require("sprites.gameObjetos")
local objectSheet = graphics.newImageSheet( "assets/img/gameObjetos.png", sheetInfo:getSheet() )


--Initialize Variables

local lives = 3
local score = 0
local died = false

local buttons = {}

local headsTable = {}

local lampiao
local gameLoopTimer
local livesText
local scoreText
local physics

local lado = "direito"

local w = display.contentWidth -- variable of width
local h = display.contentHeight -- variable of higth

local eixoX = w - 5
local eixoY = h


local sequenceLamp = {
    { name= "paradoLeft", start = 18, count = 0, time = 800 , loopCount = 0},--loopDirection = "forward"},
	{ name= "paradoRight", start = 3, count = 0, time = 800 , loopCount = 0},--loopDirection = "forward"},
    { name= "andandoRight", start= 1, count = 14, time =700, loopCount = 0}, --loopDirection= "forward" },
    { name= "andandoLeft", start= 15, count = 14, time =700, loopCount = 0},-- loopDirection= "forward" }

}


-- Set up display groups
local backGroup = display.newGroup()  -- Display group for the background image
local mainGroup = display.newGroup()  -- Display group for the Lampiao etc.
local uiGroup = display.newGroup()    -- Display group for UI objects like the score


--Physics the game
physics = require("physics")
physics.start()
-- physics.setDrawMode("hybrid")

-- Semear o gerador de números aleatórios
math.randomseed( os.time() )

--Backgroud image
local background = display.newImageRect( backGroup, "assets/img/quixada.png", 1450, 696 )
background.x = display.contentCenterX
background.y = h - 510

--Solo image
local solo = display.newImageRect( backGroup, "assets/img/solo.png", 1450, 320 )
solo.x = display.contentCenterX
solo.y = h - 50
physics.addBody(solo, "static",  {friction=.1, isSensor=false})

local cactu = display.newImageRect( backGroup, "assets/img/cactuSprite.png", 100, 70 )
cactu.x = display.contentCenterX - 80
cactu.y = solo.y-195
physics.addBody(cactu, "static", {friction= .1, isSensor=true})

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
livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end


local function update( event )
	updateBackgrounds()
end
 
function updateBackgrounds()
	--background movement
	background.x = background.x - (2)
 
	--solo movement
	solo.x = solo.x - (2)

	if(background.x < -200) then
		background.x = 600
	end
 
	solo.x = solo.x - (2)

	if(solo.x < -200) then
		solo.x = 600
	end


end

local function createInimigo()
	local newHead = display.newImageRect( mainGroup, objectSheet, 2, 47, 98 )
	table.insert( headsTable, newHead )
	physics.addBody( newHead, "dynamic", { radius=10, bounce=0.4 } )
	newHead.myName = "headGado"
	newHead.isFixedRotation = true

	local whereFrom = math.random( 3 )

	if ( whereFrom == 1 ) then
        -- From the left
        newHead.x = -60
		newHead.y = math.random( 100 )
		newHead:setLinearVelocity( math.random( 30,90 ), math.random( 10,50 ) )
	elseif ( whereFrom == 2 ) then
        -- From the top
        newHead.x = math.random( display.contentWidth )
        newHead.y =  -60
        newHead:setLinearVelocity( math.random( -20,20 ), math.random( 30,90 ) )
    elseif ( whereFrom == 3 ) then
        -- From the right
        newHead.x = display.contentWidth + 60 
        newHead.y = math.random( 100 )
        newHead:setLinearVelocity( math.random( -90,-30 ), math.random( 10,50 ) )
	end
	
	newHead:applyTorque( math.random( -3,3 ) )
end

local function tiroBala()
	if lado == "direito" then
		local newBala = display.newImageRect(mainGroup, "assets/img/municao.png", 7, 25)
        newBala.rotation=newBala.rotation-270
        physics.addBody(newBala, "dynamic", {isSensor = true})
        newBala.isBullet = true
        newBala.myName = "laser"
        newBala.x = lampiao.x+70
        newBala.y = lampiao.y+1
        newBala:toBack()
        transition.to(newBala, {x=1400, time=300, 
			onComplete = function() display.remove(newBala) end})
	elseif lado == "esquerdo" then
        local newBala = display.newImageRect(mainGroup, "assets/img/municao.png", 7, 25)
        newBala.rotation=newBala.rotation-90
        physics.addBody(newBala, "dynamic", {isSensor = true})
        newBala.isBullet = true
        newBala.myName = "laser"
        newBala.x = lampiao.x-70
        newBala.y = lampiao.y+1
        newBala:toBack()
        transition.to(newBala, {x=-300, time=300, 
			onComplete = function() display.remove(newBala) end})
	end
 end

local function gameLoop()
	
	   -- Create new asteroid
	   createInimigo()
	
	   -- Remove asteroids which have drifted off screen
	   for i = #headsTable, 1, -1 do
		local thisHead = headsTable[i]
		
			   if ( thisHead.x < -100 or
			   		thisHead.x > display.contentWidth + 50 or
			   		thisHead.y < -100 or
			   		thisHead.y > display.contentHeight + 50 )
			   then
				   display.remove( thisHead )
				   table.remove( headsTable, i )
			   end
	   end
   end

gameLoopTimer = timer.performWithDelay( 800, gameLoop, 0 )
   

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
	lado = "direito"
    lampiao:setSequence( "andandoRight" )
	lampiao:play()
    -- start moving lampiao
	lampiao:applyLinearImpulse( 1, 0, lampiao.x, lampiao.y )
	lampiao:addEventListener( "tap", tiroBala )
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
		lado = "esquerdo"
    	lampiao:setSequence( "andandoLeft" )
    	lampiao:play()
		lampiao:applyLinearImpulse( -1, 0, lampiao.x, lampiao.y )
		lampiao:addEventListener( "tap", tiroBala )
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


-- Initialize widget(Botões)
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

atack_button = widget.newButton( {
	id = "atack_button",
	width = 80,
	height = 80,
	defaultFile = "assets/buttons/lineAtack.png",
	left = 850,
	top = 640,
	onEvent = tiroBala;
} )

left_button = widget.newButton( {
	id = "left_button",
	width = 80,
	height = 80,
	defaultFile = "assets/buttons/lineLight22.png",
	left = -100,
	top = 640,
	onEvent = andandoLeft
} )

right_button = widget.newButton( {
	id = "right_button",
	width = 80,
	height = 80,
	defaultFile = "assets/buttons/lineLight23.png",
	left = 10,
	top = 640,
	onEvent = andandoRight
} )

right_button.alpha = .2;
left_button.alpha = .2;
atack_button.alpha = .2;
jump_button.alpha = .2;
jump_button.rotation = -90;

--uiGroup:insert( atk_button )
--uiGroup:insert( jump_button )
--uiGroup:insert( right_button )
--uiGroup:insert( left_button )
-- Load gamepad end

end

scene:addEventListener("create",create)
return scene