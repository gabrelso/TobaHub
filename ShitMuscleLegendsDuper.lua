-- EPIK

local Players = game:GetService("Players")

local args = {
    [1] = "acceptTrade"
}

local _wait = task.wait
local player = Players.LocalPlayer
local screenGui
local lastPosition = UDim2.new(0.5, -75, 0.5, -75)  
local function createGUI()
    if screenGui then
        screenGui:Destroy()  
    end

    screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 150)
    frame.Position = lastPosition
    frame.BackgroundTransparency = 1
    frame.Parent = screenGui

    local backgroundImage = Instance.new("ImageLabel")
    backgroundImage.Size = UDim2.new(1, 0, 1, 0)
    backgroundImage.Position = UDim2.new(0, 0, 0, 0)
    backgroundImage.Image = "rbxassetid://10889970696"
    backgroundImage.BackgroundTransparency = 1
    backgroundImage.Parent = frame

    frame.Active = true
    frame.Draggable = true

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "ML Pet Duper"
    titleLabel.Font = Enum.Font.Roboto
    titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    titleLabel.TextSize = 28
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 0, 0, 5)
    titleLabel.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0, 40)
    textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    textBox.BackgroundTransparency = 1
    textBox.TextColor3 = Color3.fromRGB(240, 240, 240)
    textBox.TextSize = 18
    textBox.PlaceholderText = "Wait time"
    textBox.Text = "1.5"
    textBox.Parent = frame

    local button = Instance.new("TextButton")
    button.Text = "Start Dupe"
    button.Font = Enum.Font.SourceSans
    button.TextColor3 = Color3.fromRGB(240, 240, 240)
    button.TextSize = 18
    button.Size = UDim2.new(0.8, 0, 0, 40)
    button.Position = UDim2.new(0.1, 0, 0.65, 0)
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    button.BackgroundTransparency = 0.5
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local waitTime = tonumber(textBox.Text) or 1.5
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
        _wait(waitTime)
        player:Kick("VAMOS TORCER PARA FUNCIONAR! [NÃO FECHE ISSO]")
        _wait(1)
        local jobId = game.JobId
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, player)
    end)

    frame:GetPropertyChangedSignal("Position"):Connect(function()
        lastPosition = frame.Position
    end)
end

local function onCharacterAdded(character)
    createGUI()
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
else
    player.CharacterAdded:Wait()
end
