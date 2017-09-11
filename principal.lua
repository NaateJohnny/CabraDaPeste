-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--OBS: Frame = quadro de animação. Ex: a sprite q usaremos contem 12 quadros de animação.

display.setStatusBar (display.HiddenStatusBar) -- esconde a barra de status 

local w = display.contentWidth -- largura da tela
local h = display.contentHeight -- altura da tela

local background = display.newImage("assets/img/quixada.png") -- cria uma nova imagem de fundo

local sheetData =  { width=107, height=115, numFrames=37 }
-- width: largura de cada frame
-- height: altura de cada frame
-- numFrames: número de frames da sprite

local sheet = graphics.newImageSheet("assets/img/lampion.png", sheetData)
-- cria uma nova imagem usando a sprite "gaara.png" e as propriedades vistas acima

local sequenceData = 
{
	{ name = "idleDown", start = 1, count = 1, time = 0, loopCount = 1 }, --idleDown = parado para baixo (é só um nome, vc quem nomeia como quiser)
	-- name: nome desse movimento
	-- start: frame da sprite onde a animação começa (nesse caso começa no primeiro frame da sprite)
	-- count: número de frames para essa animação (nesse caso essa animação só terá um frame, o primeiro, aquele q o gaara tá parado pra baixo)
	-- time: tempo de duração da animação (está zero pq essa animação só tem um quadro
	-- loopCount: número de vezes que a animação é executada, nesse caso a animação só é executada uma vez, pois só tem um frame
	
	-- os outros vetores são da mesma forma, cada um com a sua animação
    { name = "idleLeft", start = 4, count = 1, time = 0, loopCount = 1 }, --parado pra esquerda
    { name = "idleRight", start = 7, count = 1, time = 0, loopCount = 1 }, --parado pra direita
    { name = "idleUp", start = 10, count = 1, time = 0, loopCount = 1 }, --parado pra cima
	
	-- esses vetores já contem mais do q um frame de animação, então eles já mostram um movimento
    { name = "moveDown", start = 2, count = 2, time = 300, loopCount = 0 },
	-- nesse caso a animação começa do segundo frame e termina do terceiro (já q o count é igual a 2)
	-- e o 'time' é igual a 300, isso significa q essa animação (moveDown), será executada em 300 centésimos de segundo, ou 0,3 segundos
	-- o loopCount é igual a zero, isso significa q animação será executada para sempre, até q alguém cancele essa animação ou execute outra
    { name = "moveLeft", start = 5, count = 2, time = 300, loopCount = 0 },
	-- mesmo principio da animação de cima, mas agora começa no quinto frame (start=5) e contém 2 frames de animação apenas
    { name = "moveRight", start = 8, count = 2, time = 300, loopCount = 0 },
    { name = "moveUp", start = 11, count = 2, time = 300, loopCount = 0 },
}

local player = display.newSprite(sheet, sequenceData)
-- cria finalmente a sprite utilizando as propriedades vistas acima
player.x = w * .5
player.y = h * .5

player:setSequence("idleDown")
-- configura um valor inicial para sprite, nesse caso é o "idleDown", por isso o gaara começa olhando para baixo

local buttons = {}

buttons[1] = display.newImage("button.png")
buttons[1].x = 250
buttons[1].y = 380
buttons[1].myName = "up"
buttons[1].rotation = -90

buttons[2] = display.newImage("button.png")
buttons[2].x = 250
buttons[2].y = 440
buttons[2].myName = "down"
buttons[2].rotation = 90

buttons[3] = display.newImage("button.png")
buttons[3].x = 210
buttons[3].y = 410
buttons[3].myName = "left"
buttons[3].rotation = 180

buttons[4] = display.newImage("button.png")
buttons[4].x = 290
buttons[4].y = 410
buttons[4].myName = "right"

local yAxis = 0
local xAxis = 0

local touchFunction = function(e)
	local eventName = e.phase
	local direction = e.target.myName
	
	if eventName == "began" or eventName == "moved" then
		if direction == "up" then 
			player:setSequence("moveUp")
			-- caso o botão pra cima for precionado ou arrastado, 
			-- animação é trocada para a "moveUp" q mostra uma animação do gaara se movimentando para cima
			
			yAxis = -5
			xAxis = 0
		elseif direction == "down" then 
			player:setSequence("moveDown")
			-- mesmo principio do moveUp, mas agora é mostrada a animação do gaara olhando para baixo

			yAxis = 5
			xAxis = 0
		elseif direction == "right" then
			player:setSequence("moveRight")

			xAxis = 5
			yAxis = 0
		elseif direction == "left" then
			player:setSequence("moveLeft")

			xAxis = -5
			yAxis = 0
		end
	else 
		-- caso os botões sejam soltos uma dessas funções será executada, 
		-- isso serve para q quando alguém soltar os botões, o player não continue movimentando,
		-- então a animação é trocada para os frames em q o gaara está parado
		if e.target.myName == "up" then 
			player:setSequence("idleUp")
			-- a animação "idleUp"(parado para cima) é ativada se o jogar soltar o botão para cima
		elseif e.target.myName == "down" then 
			player:setSequence("idleDown")
			-- mesmo principio do "idleUp", mas agora o gaara olha para baixo
		elseif e.target.myName == "right" then
			player:setSequence("idleRight")
		elseif e.target.myName == "left" then
			player:setSequence("idleLeft")
		end
		
		yAxis = 0
		xAxis = 0
	end
end

local j=1

for j=1, #buttons do 
	buttons[j]:addEventListener("touch", touchFunction)
end

local update = function()
	player.x = player.x + xAxis
	player.y = player.y + yAxis

	if player.x <= player.width * .5 then 
		player.x = player.width * .5
	elseif player.x >= w - player.width * .5 then 
		player.x = w - player.width * .5
	end

	if player.y <= player.height * .5 then
		player.y = player.height * .5
	elseif player.y >= h - player.height * .5 then 
		player.y = h - player.height * .5
	end 
	
	player:play() --executa a animação, é necessário usar essa função para ativar a animação
end

Runtime:addEventListener("enterFrame", update)