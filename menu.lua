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
    local background = display.newImageRect(sceneGroup,"assets/img/sertaoTitulo.png", 1390,800)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- Botao Play
    local playButton = display.newImageRect(sceneGroup,"assets/img/button/placaPlay.png", 190,75)
    playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY - 50
    playButton.rotation = 05
    
    -- Botao Opcoes
    local opcoesButton = display.newImageRect(sceneGroup,"assets/img/button/placaOptions.png", 190,75)
    opcoesButton.x = display.contentCenterX - 10
    opcoesButton.y = display.contentHeight - 350
    opcoesButton.rotation = -05

    -- Botao Opcoes
    local creditosButton = display.newImageRect(sceneGroup,"assets/img/button/placaCreditos.png", 190,75)
    creditosButton.x = display.contentCenterX
    creditosButton.y = display.contentHeight - 270
    creditosButton.rotation = 05

    -- Botao sair
    local exitButton = display.newImageRect(sceneGroup,"assets/img/button/placaExit.png", 190,75)
    exitButton.x = display.contentCenterX - 10
    exitButton.y = display.contentHeight - 190
    
    --playButton:addEventListener("tap",play)
    playButton:addEventListener("tap", playGame)

    exitButton:addEventListener("tap", exitGame)
end

scene:addEventListener("create", create)
return scene