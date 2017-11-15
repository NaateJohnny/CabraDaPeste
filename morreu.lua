local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
-- Initialize variables

local finalScore

local function gotoGame()
    composer.removeScene("levels.game")
    composer.gotoScene( "levels.game", { time=800, effect="crossFade" } )
end

local function gotoMenu()
    composer.removeScene("menu")
    composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    -- Insert the saved score from the last game into the variable, then reset it
    finalScore =  composer.getVariable( "finalScore" )
    --composer.setVariable( "finalScore", 0 )
 
    local background = display.newImageRect(sceneGroup,"assets/img/sertao.png", 1390,800)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.fill.effect = "filter.grayscale"
    --background.fill.effect = "filter.pixelate"
    --background.fill.effect.numPixels = 4
 

    local abestaado = display.newText( sceneGroup, "VOCÊ MORREEEU!", display.contentCenterX, 80, "xilosa.ttf", 72 )
    abestaado:setFillColor( .8, .3, 0 )

    local morreeu = display.newText( sceneGroup, "ABESTAADÓ!", display.contentCenterX, 160, "xilosa.ttf", 72 )
    morreeu:setFillColor( .8, .3, 0 )

    local morreeu = display.newText( sceneGroup, "&", display.contentCenterX, 250, "xilosa.ttf", 72 )
    morreeu:setFillColor( .8, .3, 0 )

    local pontuacao = display.newText( sceneGroup, "Pontuação: "..finalScore, display.contentCenterX, 400, "xilosa.ttf", 44 )
    pontuacao:setFillColor( .3, .2, .1 )
 
    local gameButton = display.newText( sceneGroup, "Jogar Novamente", display.contentCenterX, 520, "xilosa.ttf", 50 )
    gameButton:setFillColor( 1, .7 , .1 )
    gameButton:addEventListener( "tap", gotoGame )

    local returnMenu = display.newText( sceneGroup, "Menu", display.contentCenterX, 600, "xilosa.ttf", 50 )
    returnMenu:setFillColor( .3, .5, 0 )
    returnMenu:addEventListener( "tap", gotoMenu )

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene