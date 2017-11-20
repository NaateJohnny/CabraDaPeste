local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
-- Initialize variables

local function gotoMenu()

    composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    local background = display.newImageRect( sceneGroup,"assets/img/sertaoPB.jpeg", 1390,800 )    
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local criado = display.newText( sceneGroup, "Desenvolvido por:" , display.contentCenterX, 50, "xilosa.ttf", 70 )
    criado:setFillColor( .8, .3, 0 )

    local photo = display.newImageRect( sceneGroup,"assets/img/naate-photo.png", 151, 151 )    
    photo.x = display.contentCenterX
    photo.y = display.contentCenterY - 185

    local nome = display.newText( sceneGroup, "Naate Johnny Oliveira" , display.contentCenterX, 50, "xilosa.ttf", 44 )
    nome.x = display.contentCenterX
    nome.y = display.contentCenterY - 85
    nome:setFillColor( .3, .2, .1 )

    local email = display.newText( sceneGroup, "naate1996@gmail.com" , display.contentCenterX, 50, "xilosa.ttf", 44 )
    email.x = display.contentCenterX
    email.y = display.contentCenterY - 35
    email:setFillColor( .3, .2, .1 )

    local github = display.newText( sceneGroup, "github.comInaatejohnny" , display.contentCenterX, 50, "xilosa.ttf", 44 )
    github.x = display.contentCenterX
    github.y = display.contentCenterY + 10
    github:setFillColor( .3, .2, .1 )

    local github = display.newText( sceneGroup, "github.comInaatejohnny" , display.contentCenterX, 50, "xilosa.ttf", 44 )
    github.x = display.contentCenterX
    github.y = display.contentCenterY + 10
    github:setFillColor( .3, .2, .1 )

    local orientado = display.newText( sceneGroup, "Orientado por:" , display.contentCenterX, 50, "xilosa.ttf", 54 )
    orientado.x = display.contentCenterX
    orientado.y = display.contentCenterY + 75
    orientado:setFillColor( .3, .5, 0 )

    local nome2 = display.newText( sceneGroup, "Eduardo Mendes de Oliveira" , display.contentCenterX, 50, "xilosa.ttf", 44 )
    nome2.x = display.contentCenterX
    nome2.y = display.contentCenterY + 135
    nome2:setFillColor( .3, .2, .1 )

   
 
    local menuButton = display.newText( sceneGroup, "Menu", display.contentCenterX, 725, "xilosa.ttf", 60 )
    menuButton:setFillColor( 1, .7 , .1 )
    menuButton:addEventListener( "tap", gotoMenu )

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		--audio.play( soundHighscore, { channel=3, loops=-1 } )
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