-----------------------------------
-------Importando a Fisica---------
local physics = require("physics")
-----------------------------------
-------Ocultando o Status Bar------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------
------Importando a Composer--------
local composer = require("composer")
-----------------------------------
-----------Criando a cena----------
local scene = composer.newScene()

local function play()
    composer.gotoScene("fases")
end
local function playGame()
    composer.gotoScene("levels.levelOne")
end
local function exitGame()
    timer.performWithDelay( 1000,
    function()
      if( system.getInfo("platformName")=="Android" ) then
        native.requestExit()
      else
        os.exit()
      end
end )
end


function scene:create(event)

    local sceneGroup = self.view
    -- Carregando o background
    local background = display.newImageRect(sceneGroup,"assets/img/sertao.png",1390,800)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    -- Botao Play
    local playButton = display.newImageRect(sceneGroup,"assets/img/button/placaPlay.png",200,80)
    playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY - 70
    -- Botao sair
    local exitButton = display.newImageRect(sceneGroup,"assets/img/button/placaExit.png",200,80)
    exitButton.x = display.contentCenterX
    exitButton.y = display.contentHeight - 300
    
    --playButton:addEventListener("tap",play)
    playButton:addEventListener("tap",playGame)

    exitButton:addEventListener("tap", exitGame)
end

scene:addEventListener("create",create)
return scene