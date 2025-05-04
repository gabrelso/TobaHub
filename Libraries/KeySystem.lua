-- Creates main UI components
local KeySystem = Instance.new("ScreenGui")
local Background_1 = Instance.new("CanvasGroup")
local ExitButton = Instance.new("ImageButton")
local UICorner_1 = Instance.new("UICorner")
local List_1 = Instance.new("Frame")
local UIListLayout_1 = Instance.new("UIListLayout")
local First_1 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Frame_1 = Instance.new("Frame")
local Desc_1 = Instance.new("TextLabel")
local Nam_1 = Instance.new("TextLabel")
local IcoBackground_1 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Ico_1 = Instance.new("ImageLabel")
local Second_1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local KeyFrame_1 = Instance.new("Frame")
local UIStroke_1 = Instance.new("UIStroke")
local UICorner_5 = Instance.new("UICorner")
local KeyBox_1 = Instance.new("TextBox")
local EnterText_1 = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local UICorner_6 = Instance.new("UICorner")
local third_1 = Instance.new("Frame")

-- Configures ScreenGui properties
KeySystem.DisplayOrder = 999
KeySystem.Name = "..."
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeySystem.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Configures background properties
Background_1.Parent = KeySystem
Background_1.AnchorPoint = Vector2.new(0.5, 0.5)
Background_1.BackgroundColor3 = Color3.fromRGB(28,28,28)
Background_1.BorderColor3 = Color3.fromRGB(0,0,0)
Background_1.BorderSizePixel = 0
Background_1.Position = UDim2.new(0.5, 0,0.5, 0)
Background_1.Size = UDim2.new(0, 500,0, 285)
Background_1.GroupTransparency = 1

-- Configures exit button
ExitButton.Parent = Background_1
ExitButton.AnchorPoint = Vector2.new(1,0)
ExitButton.Position = UDim2.new(1,0,0,0)
ExitButton.BackgroundTransparency = 1.00
ExitButton.Image = "http://www.roblox.com/asset/?id=9545003266"
ExitButton.ZIndex = 2
ExitButton.Size = UDim2.new(0,40,0,40)
ExitButton.ImageTransparency = 0.77

-- Adds corner rounding to background
UICorner_1.Parent = Background_1
UICorner_1.CornerRadius = UDim.new(0,5)

-- Configures list frame
List_1.Parent = Background_1
List_1.AnchorPoint = Vector2.new(0.5, 0.5)
List_1.BackgroundTransparency = 1
List_1.BorderColor3 = Color3.fromRGB(0,0,0)
List_1.BorderSizePixel = 0
List_1.Position = UDim2.new(0.5, 0,0.5, 0)
List_1.Size = UDim2.new(1, -10,1, -10)

-- Sets up list layout
UIListLayout_1.Parent = List_1
UIListLayout_1.Padding = UDim.new(0,8)
UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

-- Configures first section frame
First_1.Parent = List_1
First_1.BackgroundColor3 = Color3.fromRGB(36,36,36)
First_1.BorderColor3 = Color3.fromRGB(0,0,0)
First_1.BorderSizePixel = 0
First_1.Size = UDim2.new(1, 0,0, 120)

-- Adds corner rounding to first section
UICorner_2.Parent = First_1
UICorner_2.CornerRadius = UDim.new(0,5)

-- Configures inner frame for first section
Frame_1.Parent = First_1
Frame_1.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_1.BackgroundTransparency = 1
Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_1.BorderSizePixel = 0
Frame_1.Position = UDim2.new(0.5, 0,0.5, 0)
Frame_1.Size = UDim2.new(0, 200,0, 100)

-- Configures description label
Desc_1.Parent = Frame_1
Desc_1.AnchorPoint = Vector2.new(0, 1)
Desc_1.BackgroundTransparency = 1
Desc_1.BorderColor3 = Color3.fromRGB(0,0,0)
Desc_1.BorderSizePixel = 0
Desc_1.Position = UDim2.new(0, 0,1, 0)
Desc_1.Size = UDim2.new(1, 0,0.5, -10)
Desc_1.Font = Enum.Font.Arial
Desc_1.TextTransparency = 0.5
Desc_1.Text = Settings.Description
Desc_1.TextColor3 = Color3.fromRGB(255,255,255)
Desc_1.TextSize = 20
Desc_1.TextYAlignment = Enum.TextYAlignment.Top

-- Configures title label
Nam_1.Parent = Frame_1
Nam_1.AnchorPoint = Vector2.new(1, 0)
Nam_1.BackgroundTransparency = 1
Nam_1.BorderColor3 = Color3.fromRGB(0,0,0)
Nam_1.BorderSizePixel = 0
Nam_1.Position = UDim2.new(1, 0,0, 0)
Nam_1.Size = UDim2.new(0.7, 0,0.5, 0)
Nam_1.Font = Enum.Font.Arial
Nam_1.Text = Settings.Title
Nam_1.TextColor3 = Color3.fromRGB(255,255,255)
Nam_1.TextSize = 34

-- Adds logo if provided
if Settings.Logo ~= nil then
    Ico_1.Parent = Nam_1
    Ico_1.AnchorPoint = Vector2.new(1, 0.5)
    Ico_1.BackgroundColor3 = Color3.fromRGB(229, 231, 235)
    Ico_1.BorderSizePixel = 0
    Ico_1.Position = UDim2.new(0, 0,0.5, 0)
    Ico_1.Size = UDim2.new(0, 50,0, 50)
    Ico_1.Image = Settings.Logo

    UICorner_3.Parent = Ico_1
    UICorner_3.CornerRadius = UDim.new(1,0)
else
    Ico_1:Destroy()
    UICorner_3:Destroy()
    Nam_1.Size = UDim2.new(1, 0,0.5, 0)
end

-- Configures second section frame
Second_1.Parent = List_1
Second_1.BackgroundColor3 = Color3.fromRGB(36,36,36)
Second_1.BorderColor3 = Color3.fromRGB(0,0,0)
Second_1.BorderSizePixel = 0
Second_1.Size = UDim2.new(1, 0,0, 90)

-- Adds corner rounding to second section
UICorner_4.Parent = Second_1
UICorner_4.CornerRadius = UDim.new(0,5)

-- Configures key input frame
KeyFrame_1.Parent = Second_1
KeyFrame_1.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame_1.BackgroundTransparency = 1
KeyFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
KeyFrame_1.BorderSizePixel = 0
KeyFrame_1.Position = UDim2.new(0.5, 0,0.5, 0)
KeyFrame_1.Size = UDim2.new(0.9, 0,0, 55)

-- Adds stroke to key frame
UIStroke_1.Parent = KeyFrame_1
UIStroke_1.Color = Color3.fromRGB(255,255,255)
UIStroke_1.Transparency = 0.77
UIStroke_1.Thickness = 1

-- Adds corner rounding to key frame
UICorner_5.Parent = KeyFrame_1
UICorner_5.CornerRadius = UDim.new(0,5)

-- Configures key input textbox
KeyBox_1.Parent = KeyFrame_1
KeyBox_1.Active = true
KeyBox_1.AnchorPoint = Vector2.new(0.5, 0.5)
KeyBox_1.BackgroundTransparency = 1
KeyBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
KeyBox_1.BorderSizePixel = 0
KeyBox_1.CursorPosition = -1
KeyBox_1.Position = UDim2.new(0.5, 0,0.5, 0)
KeyBox_1.Size = UDim2.new(0.95, 0,0.85, 0)
KeyBox_1.TextEditable = true
KeyBox_1.Font = Enum.Font.Arial
KeyBox_1.ClipsDescendants = false
KeyBox_1.ClearTextOnFocus = false
KeyBox_1.PlaceholderText = ""
KeyBox_1.Text = ""
KeyBox_1.TextTruncate = Enum.TextTruncate.AtEnd
KeyBox_1.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox_1.TextSize = 16
KeyBox_1.TextXAlignment = Enum.TextXAlignment.Left

-- Configures placeholder text
EnterText_1.Parent = KeyBox_1
EnterText_1.AnchorPoint = Vector2.new(0, 0.5)
EnterText_1.BackgroundColor3 = Color3.fromRGB(36,36,36)
EnterText_1.BorderColor3 = Color3.fromRGB(0,0,0)
EnterText_1.BorderSizePixel = 0
EnterText_1.TextTransparency = 0.3
EnterText_1.Position = UDim2.new(0, 0,0.5, 0)
EnterText_1.Size = UDim2.new(0, 80,0, 20)
EnterText_1.Font = Enum.Font.Arial
EnterText_1.Text = "Enter key"
EnterText_1.TextColor3 = Color3.fromRGB(255,255,255)
EnterText_1.TextSize = 18
EnterText_1.TextXAlignment = Enum.TextXAlignment.Center

-- Configures third section frame
third_1.Parent = List_1
third_1.BackgroundColor3 = Color3.fromRGB(36,36,36)
third_1.BorderColor3 = Color3.fromRGB(0,0,0)
third_1.BorderSizePixel = 0
third_1.Size = UDim2.new(1, 0,0, 50)

-- Adds corner rounding to third section
UICorner_6.Parent = third_1
UICorner_6.CornerRadius = UDim.new(0,5)

-- Sets up horizontal layout for buttons
UIListLayout.Parent=third_1
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.Padding = UDim.new(0.1,0)
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Function to create buttons
local function CreateButton(text,color,callback)
    local LinkButton_1 = Instance.new("TextButton")
    local UIStroke_2 = Instance.new("UIStroke")
    local UICorner_7 = Instance.new("UICorner")

    -- Configures button properties
    LinkButton_1.Parent = third_1
    LinkButton_1.AnchorPoint = Vector2.new(0.5, 0.5)
    LinkButton_1.BackgroundColor3 = color
    LinkButton_1.BackgroundTransparency = 1
    LinkButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
    LinkButton_1.TextColor3 = color
    LinkButton_1.TextSize = 16
    LinkButton_1.BorderSizePixel = 0
    LinkButton_1.Position = UDim2.new(0.5, 0,0.5, 0)
    LinkButton_1.Size = UDim2.new(0, 100,0, 40)
    LinkButton_1.Text = text
    LinkButton_1.AutoButtonColor = false
    LinkButton_1.ClipsDescendants = true

    -- Adds stroke to button
    UIStroke_2.Parent = LinkButton_1
    UIStroke_2.Color = color
    UIStroke_2.Transparency = 0.5
    UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_2.Thickness = 1

    -- Adds corner rounding to button
    UICorner_7.Parent = LinkButton_1
    UICorner_7.CornerRadius = UDim.new(0,5)

    -- Handles button hover effects
    LinkButton_1.MouseEnter:Connect(function()
        LinkButton_1.BackgroundTransparency = 0.9
        UIStroke_2.Transparency = 0
    end)
    LinkButton_1.MouseLeave:Connect(function()
        LinkButton_1.BackgroundTransparency = 1
        UIStroke_2.Transparency = 0.5
    end)

    -- Handles button click with animation
    if UIS.MouseEnabled then
        local ms = P.LocalPlayer:GetMouse()
        local Sample = Instance.new("ImageLabel")
        Sample.Name = "Sample"
        Sample.AnchorPoint = Vector2.new(0.5,0.5)
        Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Sample.BackgroundTransparency = 1.000
        Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
        Sample.ImageColor3 = color
        Sample.ImageTransparency = 0.5
        LinkButton_1.MouseButton1Click:Connect(function()
            task.spawn(function()
                return pcall(callback)
            end)
            local c = Sample:Clone()
            c.Parent = LinkButton_1
            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
            c.Position = UDim2.new(0, x, 0, y)
            local len, size = 0.3, nil
            size = (LinkButton_1.AbsoluteSize.Y * 2)
            c:TweenSize(UDim2.new(0, size, 0, size), 'Out', 'Quad', len, true, nil)
            for i = 1, 10 do
                c.ImageTransparency = c.ImageTransparency + 0.05
                wait(len / 12)
            end
            c:Destroy()
        end)
    else
        LinkButton_1.MouseButton1Click:Connect(function()
            task.spawn(function()
                return pcall(callback)
            end)
            local l = LinkButton_1.BackgroundTransparency
            LinkButton_1.BackgroundTransparency = 0.5
            wait(.2)
            LinkButton_1.BackgroundTransparency = l
        end)
    end
end
