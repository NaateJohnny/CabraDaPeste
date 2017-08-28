-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--Load Sprite Sheets
local lampiaoSpritSheet = require("sprites.lampiaoSheet")

local lampiaoObjectSheet = graphics.newImageSheet( "assets/img/lampiao.png", lampiaoSpritSheet.getSheet() )

local runnerLampiao = {
    { name = "go", frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}}
}

--Initialize Variables
local lives = 3
local score = 0
local died = false

--local lampiaoTable {}

local lampiao
local gameLoopTimer
local livesText
local scoreText
local physics

-- Set up display groups
local backGroup = display.newGroup()  -- Display group for the background image
local mainGroup = display.newGroup()  -- Display group for the Lampiao etc.
local uiGroup = display.newGroup()    -- Display group for UI objects like the score



--Physics the game
physics = require("physics")
physics.start()


--Backgroud image
local background = display.newImageRect( backGroup, "assets/img/quixada.png", 1450, 696 )
background.x = display.contentCenterX
background.y = display.contentHeight-510

--Solo image
local solo = display.newImageRect( backGroup, "assets/img/solo.png", 1450, 320 )
solo.x = display.contentCenterX
solo.y = display.contentHeight-01
physics.addBody(solo, "static",  {friction=1})


lampiao = display.newSprite( mainGroup, lampiaoObjectSheet, runnerLampiao)
lampiao.x = display.contentCenterX - 650
lampiao.y = display.contentHeight - 210
physics.addBody( lampiao, "dynamic", {radius=30, bounce=0.1, friction=2, isSensor=false} )
lampiao.myName = "lampiao"

-- Display lives and score
livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end

local function goLampiao( event )
    local lampiao = event.target
    local phase = event.phase

    if ( "began" == phase ) then
        -- Set touch focus on the lampiao
        display.currentStage:setFocus( lampiao )
        -- Store initial offset position
        lampiao.touchOffsetX = event.x - lampiao.x

        elseif ( "moved" == phase ) then
        -- Move the lampiao to the new touch position
        lampiao.x = event.x - lampiao.touchOffsetX

        elseif ( "ended" == phase or "cancelled" == phase ) then
        -- Release touch focus on the lampiao
        display.currentStage:setFocus( nil )
    end

    return true  -- Prevents touch propagation to underlying objects
end

lampiao:addEventListener( "touch", goLampiao )