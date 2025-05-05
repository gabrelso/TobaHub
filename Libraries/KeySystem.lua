-- Gets Roblox services
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local P = game:GetService("Players")
local HS = game:GetService("HttpService")

-- Sets global functions
_G["setclipboard"] = write_clipboard or writeclipboard or setclipboard or set_clipboard or nil
_G["request"] = http_request or request or httprequest or nil
_G["readfile"] = readfile or read_file or nil
_G["writefile"] = writefile or write_file or nil
_G["isfile"] = isfile or is_file or nil

-- Function to check global variable existence
local function getGlobal(path)
	local value = ((getgenv and getgenv()) or getfenv())
	while value ~= nil and path ~= "" do
		local name, nextValue = string.match(path, "^([^.]+)%.?(.*)$")
		value = value[name]
		path = nextValue
	end
	return value~=nil
end

-- Function to make UI element draggable
local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	-- Updates position during drag
	local function Update(input)
		local Delta = input.Position - DragStart
		local DX, DY= Delta.X,Delta.Y
		local pos = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + DX,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + DY
		)
		TS:Create(object,TweenInfo.new(.2,Enum.EasingStyle.Back),{Position = pos}):Play()
	end

	-- Starts dragging on input
	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						Dragging = false
					end)
			end
		end)

	-- Tracks drag movement
	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	-- Updates position on input change
	UIS.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

-- Prints credits. Plase don't remove it
print("Credits to https://github.com/OopssSorry")

-- Library object definition
local Lib = {}

-- Library initialization function
function Lib:Init(Settings)
	local tic = tick()
	Settings=Settings or {}
	Settings.Debug=Settings.Debug or true

	-- Debug mode environment check
	if Settings.Debug==true then		
		if not _G["UNCks_checked"] then
			print("⏺️[UNC] Starting environment check for script")
			local fails,passes=0,0
			for _, func in pairs({"setclipboard","request","readfile","writefile","isfile"}) do
				local success = getGlobal(func)
				if success then
					passes=passes+1
					print("✅[UNC] Check of \"" .. func .. "\" was passed")
				else
					fails=fails+1
					warn("⛔[UNC] Check of \"" .. func .. "\" was failed ")
				end
			end
			_G["UNCks_checked"] = true
			local rate = math.round(passes / (passes + fails) * 100)
			print(("⏺️[UNC] Checked with a %s%% success rate (%s out of %s)"):format(rate,passes,(passes + fails)))
		end
		print("⏺️[Key System] Loading...")
	end

	-- Sets default settings
	for name, value in pairs({
		["Debug"]= true,
		["Verify"]= function(...)return true end,
		["Title"]= "Title Example",
		["Link"]="https://google.com",
		["SaveKey"]=true,
		}) do
		if Settings[name]==nil or typeof(Settings[name])~=typeof(value) then
			Settings[name]=value
			if Settings.Debug == true then
				warn(("⚠️[KeySystem] Setting \"%s\" is not %s."):format(name,typeof(value)))
			end
		end
	end
	Settings["Description"]=Settings["Decription"] or "Click \"Get Key\" button to get your key!"

	-- Key system variable
	local _5432Key543Entered7654 = false

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

	-- Makes UI draggable
	MakeDraggable(First_1, Background_1)

	-- Exit button hover effects
	ExitButton.MouseEnter:Connect(function()
		ExitButton.ImageTransparency = 0
	end)
	ExitButton.MouseLeave:Connect(function()
		ExitButton.ImageTransparency = 0.77
	end)

	-- Handles exit button click
	local Closed = false
	ExitButton.MouseButton1Click:Connect(function()
		Closed = true
		KeySystem:Destroy()
	end)

	-- Key input hover and focus effects
	local Focused = false
	KeyBox_1.MouseEnter:Connect(function()
		if not Focused then
			UIStroke_1.Transparency = 0
		end
	end)
	KeyBox_1.MouseLeave:Connect(function()
		if not Focused then
			UIStroke_1.Transparency = 0.77
		end
	end)
	KeyBox_1.Focused:Connect(function()
		Focused = true
		TS:Create(EnterText_1,TweenInfo.new(.2,Enum.EasingStyle.Cubic),{Position = UDim2.new(0, 5,0, 0),TextSize = 14, Size = UDim2.new(0, 65,0, 20)}):Play()
		EnterText_1.TextColor3 = Color3.fromRGB(144, 202, 249)
		EnterText_1.TextTransparency = 0
		UIStroke_1.Transparency = 0
		UIStroke_1.Color = Color3.fromRGB(144, 202, 249)
	end)
	KeyBox_1.FocusLost:Connect(function()
		Focused = false
		EnterText_1.TextColor3 = Color3.fromRGB(255, 255, 255)
		EnterText_1.TextTransparency = 0.3
		UIStroke_1.Transparency = 0.77
		UIStroke_1.Color = Color3.fromRGB(255, 255, 255)
		local CurrentKeyInput = KeyBox_1.Text
		if string.gsub(CurrentKeyInput," ","") == "" then
			TS:Create(EnterText_1,TweenInfo.new(.2,Enum.EasingStyle.Cubic),{Position = UDim2.new(0, 0,0.5, 0),TextSize = 16, Size = UDim2.new(0, 80,0, 20)}):Play()
		elseif typeof(Settings.Verify)== "function" then
			local a = Settings.Verify(CurrentKeyInput)
			if typeof(a)=="boolean" then
				_5432Key543Entered7654= a
				if Settings.Debug == true then
					if a then
						print("✅[Key System] Key is valid"..(" (%s)"):format(CurrentKeyInput))
					else
						print("⛔[Key System] Key is invalid"..(" (%s)"):format(CurrentKeyInput))
					end
				end
			end
		end
	end)

	-- Creates Get Key button
	CreateButton("Get Key",Color3.fromRGB(144, 250, 144),function()
		KeyBox_1.Text=Settings.Link
		KeyBox_1:CaptureFocus()
		if typeof(setclipboard)=="function" then
			setclipboard(Settings.Link)
		end
	end)

	-- Creates Discord button if applicable
	if Settings.Discord~=nil and typeof(request)=="function" then
		CreateButton("Discord",Color3.fromRGB(70, 144, 250),function()
			KeyBox_1.Text = Settings.Discord
			KeyBox_1:CaptureFocus()
			if Settings.Discord:lower():find("discord") then
				pcall(function()
					local DiscordInvite = Settings.Discord
					DiscordInvite = string.gsub(DiscordInvite, "https://", "")
					DiscordInvite = string.gsub(DiscordInvite, "http://", "")
					for _,v in pairs({"discord.gg","discord.com/invite"}) do
						DiscordInvite = string.gsub(DiscordInvite, v.."/", "")
						DiscordInvite = string.gsub(DiscordInvite, v, "")
					end
					request({
						Url = "http://127.0.0.1:6463/rpc?v=1",
						Method = "POST",
						Headers = {
							["Content-Type"] = "application/json",
							["Origin"] = "https://discord.com"
						},
						Body = HS:JSONEncode({
							cmd = "INVITE_BROWSER",
							args = {
								code = DiscordInvite
							},
							nonce = HS:GenerateGUID(false)
						}),
					})
				end)
			end
			if typeof(setclipboard)=="function" then
				setclipboard(Settings.Discord)
			end
		end)
	end

	-- Prints load time in debug mode
	if Settings.Debug == true then
		print("⏺️[Key System] Loaded in " ..  math.max(0.01,math.floor((tick()-tic)*100)/100) .. " seconds")
	end

	-- Loads saved key if available
	if Settings.SaveKey and readfile and isfile and isfile(Settings["Title"]:gsub(" ",""):lower() .. ".key") then
		local CurrentKeyInput = readfile(Settings["Title"]:gsub(" ",""):lower() .. ".key") 
		_5432Key543Entered7654= pcall(Settings.Verify,CurrentKeyInput)
		if Settings.Debug == true then
			if _5432Key543Entered7654 then
				print("✅[Key System] Saved key is valid"..(" (%s)"):format(CurrentKeyInput))
			else
				print("⛔[Key System] Saved key is invalid"..(" (%s)"):format(CurrentKeyInput))
			end
		end
	end

	-- Handles key validation and UI lifecycle
	if _5432Key543Entered7654 then
		return true
	else
		TS:Create(Background_1,TweenInfo.new(0.33),{GroupTransparency=0}):Play()
		repeat wait() until _5432Key543Entered7654 == true or Closed == true
		if Settings.SaveKey and _5432Key543Entered7654 and writefile then
			writefile(Settings["Title"]:gsub(" ",""):lower() .. ".key", KeyBox_1.Text) 
		end
		task.spawn(function()
			local T = TS:Create(Background_1,TweenInfo.new(0.33),{GroupTransparency=1})
			T:Play()
			T.Completed:Wait()
			KeySystem:Destroy()
		end)
        Lib.KeySystem = KeySystem
		return _5432Key543Entered7654
	end
end

-- Sets library to global environment
getgenv().Lib=Lib
return Lib
