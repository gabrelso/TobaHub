local function getService(s)
  return cloneref and cloneref(game:GetService(s)) or game:GetService(s)
end

local UserInputService = getService("UserInputService")
local TweenService = getService("TweenService")
local CoreGui = getService("CoreGui")
local TeleportService = getService("TeleportService")
local Players = getService("Players")
local HttpService = getService("HttpService")

local function GetGameImage(placeId)
    local universeUrl = "https://apis.roblox.com/universes/v1/places/"..placeId.."/universe"
    local universeResponse = game:HttpGet(universeUrl)
    local universeData = HttpService:JSONDecode(universeResponse)
    if not universeData or not universeData.universeId then
        return nil
    end
    local thumbUrl = "https://thumbnails.roblox.com/v1/games/icons?universeIds="..universeData.universeId.."&size=512x512&format=Png&isCircular=false"
    local thumbResponse = game:HttpGet(thumbUrl)
    local thumbData = HttpService:JSONDecode(thumbResponse)
    if thumbData and thumbData.data and thumbData.data[1] then
        return thumbData.data[1].imageUrl
    end
    return nil
end

local Library = {}

function Library:Window(Info)
    local Info = Info or {}
    local TitleText = Info.Title or "Toba Hub"

    local window = {}

    local uiparent = gethui and gethui() or CoreGui
    
    local TobaHubGui = Instance.new("ScreenGui")
    TobaHubGui.Name = "TobaHubGui"
    TobaHubGui.Parent = uiparent

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.fromOffset(400, 330)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    mainFrame.BackgroundTransparency = 0.25 
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = false
    mainFrame.Active = true 
    mainFrame.Draggable = true
    mainFrame.Parent = TobaHubGui

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = mainFrame
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(255, 255, 255)
    mainStroke.Transparency = 0.85
    mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    mainStroke.Parent = mainFrame

    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundTransparency = 1
    topBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Text = TitleText
    title.Font = Enum.Font.GothamMedium
    title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(240, 240, 240)
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Parent = topBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.fromOffset(24, 24)
    closeBtn.Position = UDim2.new(1, -34, 0.5, -12)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = Color3.fromRGB(255, 95, 86)
    closeBtn.ZIndex = 3
    closeBtn.Parent = topBar

    closeBtn.MouseButton1Click:Connect(function()
        TobaHubGui:Destroy()
    end)

    local sectionContainer = Instance.new("Frame")
    sectionContainer.Name = "SectionContainer"
    sectionContainer.Size = UDim2.new(1, -24, 1, -52)
    sectionContainer.Position = UDim2.new(0, 12, 0, 40)
    sectionContainer.BackgroundTransparency = 1
    sectionContainer.ClipsDescendants = true
    sectionContainer.Parent = mainFrame

    function window:Section(SecInfo)
        local section = {}
        
        local unsupportedText = Instance.new("TextLabel")
        unsupportedText.Name = "UnsupportedText"
        unsupportedText.Size = UDim2.new(1, 0, 0, 20)
        unsupportedText.BackgroundTransparency = 1
        unsupportedText.Text = "Current game not supported!"
        unsupportedText.TextColor3 = Color3.fromRGB(255, 50, 50)
        unsupportedText.Font = Enum.Font.GothamBold
        unsupportedText.TextSize = 14
        unsupportedText.Parent = sectionContainer

        local supportedLabel = Instance.new("TextLabel")
        supportedLabel.Name = "SupportedLabel"
        supportedLabel.Size = UDim2.new(1, 0, 0, 20)
        supportedLabel.Position = UDim2.new(0, 0, 0, 22)
        supportedLabel.BackgroundTransparency = 1
        supportedLabel.Text = "Supported games:"
        supportedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        supportedLabel.Font = Enum.Font.GothamMedium
        supportedLabel.TextSize = 12
        supportedLabel.Parent = sectionContainer

        local scroll = Instance.new("ScrollingFrame")
        scroll.Size = UDim2.new(1, 0, 1, -45)
        scroll.Position = UDim2.new(0, 0, 0, 45)
        scroll.BackgroundTransparency = 1
        scroll.BorderSizePixel = 0
        scroll.ScrollBarThickness = 2
        scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
        scroll.Parent = sectionContainer

        local listLayout = Instance.new("UIListLayout")
        listLayout.Padding = UDim.new(0, 6)
        listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Parent = scroll

        listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
        end)

        function section:AddRow(placeId, text)
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -8, 0, 32) 
            row.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            row.BackgroundTransparency = 0.9 
            row.BorderSizePixel = 0
            row.Parent = scroll
          
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 8)
            corner.Parent = row
            
            local img = Instance.new("ImageLabel")
            img.Image = GetGameImage(places)
            img.Size = UDim2.fromOffset(24, 24)
            img.Position = UDim2.fromOffset(4, 4)
            img.BackgroundTransparency = 1
            img.ZIndex = 2
            img.Parent = row
          
            local imgCorner = Instance.new("UICorner")
            imgCorner.CornerRadius = UDim.new(0, 6)
            imgCorner.Parent = img
          
            local label = Instance.new("TextLabel")
            label.Text = text
            label.TextColor3 = Color3.fromRGB(240, 240, 240)
            label.TextSize = 13
            label.Font = Enum.Font.GothamMedium
            label.BackgroundTransparency = 1
            label.Position = UDim2.fromOffset(36, 0)
            label.Size = UDim2.new(1, -120, 1, 0)
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.ZIndex = 2
            label.Parent = row
          
            local btn = Instance.new("TextButton")
            btn.Text = "Launch"
            btn.Font = Enum.Font.GothamMedium
            btn.TextSize = 12
            btn.Size = UDim2.fromOffset(60, 24)
            btn.Position = UDim2.new(1, -68, 0.5, -12)
            btn.BackgroundColor3 = Color3.fromRGB(33, 144, 255)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.AutoButtonColor = true
            btn.BackgroundTransparency = 0
            btn.ZIndex = 2
            btn.Parent = row
          
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn
          
            btn.MouseButton1Click:Connect(function()
                TeleportService:Teleport(placeId, Players.LocalPlayer)
            end)
        end

        function section:AddClearButton()
            local clearBtn = Instance.new("TextButton")
            clearBtn.Name = "ClearButton"
            clearBtn.Text = "Clear List"
            clearBtn.Font = Enum.Font.GothamMedium
            clearBtn.TextSize = 12
            clearBtn.Size = UDim2.fromOffset(70, 26)
            clearBtn.Position = UDim2.new(1, -114, 0.5, -13)
            clearBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            clearBtn.ZIndex = 3
            clearBtn.Parent = topBar

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = clearBtn

            clearBtn.MouseButton1Click:Connect(function()
                for _, child in pairs(scroll:GetChildren()) do
                    if child:IsA("Frame") then
                        child:Destroy()
                    end
                end
            end)
        end

        return section
    end

    return window
end

return Library

