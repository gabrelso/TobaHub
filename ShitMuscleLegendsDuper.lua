local Players = game:GetService("Players")

local function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 150)
    frame.Position = UDim2.new(0.5, -75, 0.5, -75)
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

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button

    button.MouseButton1Click:Connect(function()
        task.wait(3)
        Players.LocalPlayer:Kick("Lets hope it worked!")
    end)

    local closeButton = Instance.new("TextButton")
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.SourceSans
    closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.TextSize = 20
    closeButton.Size = UDim2.new(0.1, 0, 0, 30)
    closeButton.Position = UDim2.new(0.9, 0, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundTransparency = 0.5
    closeButton.Parent = frame

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

Players.LocalPlayer.CharacterAdded:Connect(function()
    createGui()
end)

createGui()
