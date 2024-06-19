-- Criando uma ScreenGui para conter a interface
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Name = "MyCustomGui"
gui.Parent = game:GetService("CoreGui")

-- Função para criar cantos circulares
local function createCorner(parent)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)  -- Raio dos cantos
    corner.Parent = parent
end

-- Criando o frame principal com fundo preto e cantos circulares
local mainFrame = Instance.new("Frame")
mainFrame.AnchorPoint = Vector2.new(1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Fundo preto
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(1, -20, 0, 20)  -- Canto superior direito, com margem de 20 pixels da borda
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Name = "MainFrame"
mainFrame.Parent = gui

-- Criar cantos circulares no frame principal
createCorner(mainFrame)

-- Função para criar um TextLabel com propriedades padrão
local function createTextLabel(text, textSize, textPositionY)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(148, 0, 211)  -- Roxo escuro
    textLabel.TextSize = textSize
    textLabel.BackgroundTransparency = 1  -- Fundo completamente transparente
    textLabel.Size = UDim2.new(1, 0, 0, textSize + 4)  -- Largura total e altura do texto mais margem
    textLabel.Position = UDim2.new(0.5, 0, textPositionY, 0)  -- Posição centralizada verticalmente
    textLabel.AnchorPoint = Vector2.new(0.5, 0)  -- Ancoragem no topo
    textLabel.TextXAlignment = Enum.TextXAlignment.Center  -- Centralizar texto horizontalmente
    textLabel.TextWrapped = true  -- Permite que o texto quebre linha se necessário
    textLabel.Parent = mainFrame
    return textLabel
end

-- Criando os TextLabels com diferentes tamanhos de texto e posições
local titleText = createTextLabel("Kills Tracker UwU", 18, 0.15)  -- Título no topo
local levelText = createTextLabel("Kills: 0", 14, 0.45)   -- Texto do nível no meio
local playersText = createTextLabel("Players: 0", 14, 0.75)   -- Texto do nível no meio



-- Função para atualizar o valor de kills a cada 0.5 segundos
spawn(function()
    while true do
        levelText.Text = "Kills: " .. (game.Players.LocalPlayer.otherstats.Kill.Value)
        wait(0.5)
    end
end)



spawn(function()
    while true do
        -- Obter a quantidade de jogadores no servidor
        local playerCount = #game.Players:GetPlayers()

        -- Atualizar o texto de playersText
        playersText.Text = "Players: " .. playerCount

        wait(0.5)
    end
end)




-- Função para tornar a GUI arrastável
local function enableDragging(frame)
    local dragInput
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragInput = nil
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Ativar a funcionalidade de arrastar para o frame principal
enableDragging(mainFrame)
