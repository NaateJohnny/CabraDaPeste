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

local function playGame()
    composer.removeScene("levels.game")
    composer.gotoScene("levels.game", { time=800, effect="crossFade" } )
end

local function PontosGame()
    composer.removeScene("highscores")
    composer.gotoScene("highscores", { time=800, effect="crossFade" } )
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
    local background = display.newImageRect(sceneGroup,"assets/img/BackgroundMenu.png", 1390,800)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- Botao Play
    local playButton = display.newImageRect(sceneGroup,"assets/img/button/placaJogar.png", 190,75)
    playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY - 50
    playButton.rotation = 05
    
    -- Botao Pontos
    local pontosButton = display.newImageRect(sceneGroup,"assets/img/button/placaPontos.png", 190,75)
    pontosButton.x = display.contentCenterX - 10
    pontosButton.y = display.contentHeight - 350
    pontosButton.rotation = -05

    -- Botao Opcoes
    local creditosButton = display.newImageRect(sceneGroup,"assets/img/button/placaCreditos.png", 190,75)
    creditosButton.x = display.contentCenterX
    creditosButton.y = display.contentHeight - 270
    creditosButton.rotation = 05

    -- Botao sair
    local exitButton = display.newImageRect(sceneGroup,"assets/img/button/placaSair.png", 190,75)
    exitButton.x = display.contentCenterX - 10
    exitButton.y = display.contentHeight - 190
    
    --playButton:addEventListener("tap",play)
    playButton:addEventListener("tap", playGame)

    pontosButton:addEventListener("tap", PontosGame)

    exitButton:addEventListener("tap", exitGame)
end

scene:addEventListener("create", create)
return scene