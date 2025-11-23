local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local goals = workspace.Goals
local AwayGoal, HomeGoal = goals.Away, goals.Home
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function JoinGame()
    if LocalPlayer.Team.Name ~= "Visitor" then return end
    while Toggles.JoinGameToggle.Value and LocalPlayer.Team.Name == "Visitor" do
        task.wait(0.1)
        for _, v in ipairs(ReplicatedStorage.Teams:GetDescendants()) do
            if v:IsA("ObjectValue") and v.Value == nil then
                local args = {string.sub(v.Parent.Name, 1, #v.Parent.Name - 4), v.Name}
                ReplicatedStorage.Packages.Knit.Services.TeamService.RE.Select:FireServer(unpack(args))
            end
        end
    end
end

local function AutoGoal()
    if LocalPlayer.Team.Name == "Visitor" then return end
    while Toggles.AutoGoalToggle.Value do
        task.wait(0.1)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local hasBall = workspace[LocalPlayer.Name].Values.HasBall.Value
            if hasBall then
                local kick = { [1] = 150, [4] = Vector3.new(0.805526614189148, -0.5192526578903198, 0.2854881286621094) }
                ReplicatedStorage.Packages.Knit.Services.BallService.RE.Shoot:FireServer(unpack(kick))
                repeat
                    task.wait()
                until workspace:FindFirstChild("Football") and workspace.Football:FindFirstChild("Hitbox")
                local Goal = LocalPlayer.Team.Name == "Away" and AwayGoal or HomeGoal
                workspace.Football.Hitbox:PivotTo(Goal:GetPivot())
            end
        end
    end
end

local function GetBall()
    if LocalPlayer.Team.Name == "Visitor" then return end
    while Toggles.GetBallToggle.Value do
        task.wait(Options.GetBallCooldownSlider.Value)
        repeat
            task.wait()
        until workspace:FindFirstChild("Football")
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            if workspace.Football:FindFirstChild("Hitbox") then
                LocalPlayer.Character:PivotTo(workspace.Football.Hitbox:GetPivot())
            end
        end
    end
end

local repo = "https://raw.githubusercontent.com/gabrelso/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = getgenv().Linoria.Options
local Toggles = getgenv().Linoria.Toggles

local Window = Library:CreateWindow({
    Title = "Toba Hub : BL Rivals",
    Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true,
    TabPadding = 8,
    MenuFadeTime = 0.2,
    Size = UDim2.fromOffset(getgenv().UI_Size or 500, 300),
})

local Tabs = {
    Main = Window:AddTab("Main"),
    ["UI Settings"] = Window:AddTab("UI Settings"),
}

local MainGbox = Tabs.Main:AddLeftGroupbox("Principal")

MainGbox:AddToggle("AutoGoalToggle", { Text = "Auto Gol" }):OnChanged(AutoGoal)
MainGbox:AddDivider()
MainGbox:AddSlider("GetBallCooldownSlider", { Text = "Delay do TP", Default = 0.1, Min = 0.1, Max = 5, Rounding = 1 })
MainGbox:AddToggle("GetBallToggle", { Text = "Pegar bola (TP)" }):OnChanged(GetBall)
MainGbox:AddDivider()
MainGbox:AddToggle("JoinGameToggle", { Text = "Entrar nos times" }):OnChanged(JoinGame)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
ThemeManager:SetFolder("TobaHub")
SaveManager:SetFolder("TobaHub/BL-Rivals")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
