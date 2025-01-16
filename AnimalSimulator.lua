local Toba
local OL = local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

if Toba == true then
  OL:OrionLib:MakeNotification({ Name = "Toba Hub", Content = "Toba Hub is already loaded!", Image = "rbxassetid://4483345998", Time = 5 })
  else
    return
end

-- [[ Boot up ]]
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/gabrelso/RedzLibV5-fork/refs/heads/main/Source.lua"))()

local vu = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local Window = redzlib:MakeWindow({
    Title = "Toba Hub : Animal Sim",
    SubTitle = "by __zgab",
    SaveFolder = "tobahub-animalSim.json"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18372013477", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) }
})

-- [[ Values ]]
getgenv().autoCoin = false
getgenv().attacker = false
getgenv().autoBoss = false
getgenv().autoBoss2 = false
getgenv().damage = false
getgenv().hitboxEnable = false
getgenv().fireDamage = false
getgenv().killAura = false
getgenv().fireAura = false
getgenv().view = false
local nameToDamage = ""
local definedDummy

-- [[ Tabs ]]
local Tab = Window:MakeTab({ Title = "Main", Icon = "Info" })
local Tab1 = Window:MakeTab({ Title = "Auto Farm", Icon = "Home" })
local Tab2 = Window:MakeTab({ Title = "PvP", Icon = "Swords" })
local Tab3 = Window:MakeTab({ Title = "Bosses", Icon = "Bug" })
local Tab4 = Window:MakeTab({ Title = "Misc", Icon = "Settings" })

local Section2 = Tab:AddSection("---------------------------------------------\nThe Anti AFK is always enabled!\n---------------------------------------------")
local Section3 = Tab:AddSection("")
local Section = Tab:AddSection("Script Credits | Owner: __zgab")

Tab:AddDiscordInvite({
    Name = "Toba Hub",
    Logo = "rbxassetid://18372013477",
    Invite = "https://discord.gg/5EXpgEy4sJ"
})

local Section1 = Tab:AddSection("Library Credits | Owner: real_redz")
Tab:AddDiscordInvite({
    Name = "redz Hub | Community",
    Logo = "rbxassetid://17382040552",
    Invite = "https://discord.gg/7aR7kNVt4g"
})

-- [[ Tab1 options (auto farm) ]]
local Section = Tab1:AddSection({ Name = "Dummy" })
Tab1:AddToggle({
    Name = "Auto Dummy",
    Default = false,
    Callback = function(Value)
        getgenv().attacker = Value
        NewLoop = Value
        if Value then
            dummyLoop()
        end
    end    
})

local Section1 = Tab1:AddSection({ Name = "Coins" })
Tab1:AddToggle({
    Name = "Auto Coins",
    Default = false,
    Callback = function(Value)
        getgenv().autoCoin = Value
        if Value then
            getCoins()
        end
    end    
})

Tab1:AddButton({
    Name = "Remove Coins",
    Callback = function()
        while true do
            wait()
            local args = {
                [1] = "bayad"
            }
            game:GetService("ReplicatedStorage").ValentinesEvent.RemoteEvent:FireServer(unpack(args))
        end
    end
})

-- [[ Funções Tab2 (PvP) ]]
local Section3 = Tab2:AddSection({ Name = "HitBox" })

local tamanho_do_penis, transparencia
Tab2:AddTextBox({
    Name = "HitBox Size",
    Default = "",
    TextDisappear = false,
    Callback = function(HitboxSize)
        tamanho_do_penis = HitboxSize
    end      
})

Tab2:AddTextBox({
    Name = "HitBox Transparency",
    Default = "",
    TextDisappear = false,
    Callback = function(HitboxTransparency)
        transparencia = HitboxTransparency
    end
})

Tab2:AddToggle({
    Name = "Toggle HitBox",
    Default = false,
    Callback = function(Value3)
        getgenv().hitboxEnable = Value3
        if Value3 then
            hitbox()
        else
            for i, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v.Character.HumanoidRootPart.Transparency = 1
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end
})

local Section6 = Tab2:AddSection({ Name = "Damage Players" })
local plrsDropdown = Tab2:AddDropdown({
    Name = "Players List",
    Description = "Select a player to attack",
    Options = {},
    Default = "",
    Flag = "dropdown teste",
    Callback = function(Value33)
        print(Value33)
        nameToDamage = Value33
    end
})

local function updateDropdown()
    local players = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name ~= game.Players.LocalPlayer.Name then
            table.insert(players, player.Name)
        end
    end
    plrsDropdown:Set(players)
end

updateDropdown()

Tab2:AddButton({
    Name = "Refresh Dropdown",
    Callback = function()
        updateDropdown()
    end
})

Tab2:AddToggle({
    Name = "Damage Player (Punch)",
    Default = false,
    Callback = function(Value)
        getgenv().damage = Value
        if Value then
            dealDamage()
        end
    end    
})

Tab2:AddToggle({
    Name = "Damage Player (Fireball)",
    Default = false,
    Callback = function(Value68)
        getgenv().fireDamage = Value68
        if Value68 then
            dealFireDamage()
        end
    end    
})

Tab2:AddButton({
    Name = "Teleport to Player",
    Callback = function()
        local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
        local targetPlayer = game.Players:FindFirstChild(nameToDamage)

        if targetPlayer and targetPlayer.Character then
            local p2 = targetPlayer.Character.HumanoidRootPart
            p1.CFrame = p2.CFrame
        end
    end
})

Tab2:AddToggle({
    Name = "Teleport Below Player (Loop)",
    Default = false,
    Callback = function(Value45)
        getgenv().view = Value45
        if Value45 then
            teleportBelow()
        end
    end    
})

Tab2:AddToggle({
    Name = "View Player",
    Default = false,
    Callback = function(Value90)
        getgenv().view = Value90
        if Value90 then
            viewPerson()
        else
            local camera = game.Workspace.CurrentCamera
            camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
            camera.CameraType = Enum.CameraType.Custom
        end
    end    
})

local Section9 = Tab2:AddSection({
    Name = "Auras"
})

Tab2:AddToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(Value67)
        getgenv().killAura = Value67
        if Value67 then
            killAura()
        end
    end    
})

Tab2:AddToggle({
    Name = "Kill Aura + Fireball",
    Default = false,
    Callback = function(Value823)
        getgenv().fireAura = Value823
        if Value823 then
            fireAura()
        end
    end    
})

-- [[ Funções Tab3 (Bosses) ]]
local Section3 = Tab3:AddSection({
    Name = "Bosses"
})

Tab3:AddDropdown({
    Name = "Select Boss",
    Default = "",
    Description = "Select a boss to kill",
    Options = {"DragonGiraffe", "LavaGorilla", "Griffin", "CENTAUR", "CRABBOSS"},
    Callback = function(Value4)
        bossSelect = Value4
    end 
})

Tab3:AddToggle({
    Name = "Kill selected Boss",
    Default = false,
    Callback = function(Value5)
        getgenv().autoBoss = Value5
        if Value5 then
            dealBossDamage()
        end
    end
})

Tab3:AddToggle({
    Name = "Kill selected Boss 'Instantly'",
    Default = false,
    Callback = function(Value77)
        getgenv().autoBoss2 = Value77
        if Value77 then
            killBoss()
        end
    end
})

Tab3:AddButton({
    Name = "Kill all Bosses 'Instantly'",
    Callback = function()
        instaCrab()
        instaLava()
        instaGriffin()
        instaCentaur()
        instaDragon()
    end
})

-- [[ Funções Tab4 (Misc) ]]
local Section2 = Tab4:AddSection({
    Name = "Extra Functions (AS)"
})

Tab4:AddButton({
    Name = "Get Lightningball",
    Callback = function()
        local currentCFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
        local esperma = CFrame.new(-40.60783767700195, 602.1058349609375, 786.2437744140625)

        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = esperma
        wait(0.2)
        fireproximityprompt(Workspace.PickFolder.rock.ProximityPrompt)
        wait(0.2)
        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = currentCFrame
    end    
})

local Section3 = Tab4:AddSection({
    Name = "Extra Functions (Roblox)"
})

Tab4:AddButton({
    Name = "Reset",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
    end    
})

Tab4:AddButton({
    Name = "Rejoin",
    Callback = function()
        function GetJobID()
            return game.JobId
        end

        function ReconnectToServer(currentJobID)
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, currentJobID)
        end

        local currentJobID = GetJobID()
        ReconnectToServer(currentJobID)
    end
})

local ThemesSection = Tab4:AddSection({
    Name = "Themes"
})

Tab4:AddButton({
    Name = "Dark Theme",
    Callback = function()
        redzlib:SetTheme("Dark")
    end
})

Tab4:AddButton({
    Name = "Darker Theme",
    Callback = function()
        redzlib:SetTheme("Darker")
    end
})

Tab4:AddButton({
    Name = "Dark Purple Theme",
    Callback = function()
        redzlib:SetTheme("Purple")
    end
})

-- [[ Callback functions ]]
function getCoins()
    spawn(function()
        while getgenv().autoCoin do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CoinEvent"):FireServer()
            wait(0.1)
        end
    end)
end

function dummyLoop()
    spawn(function()
        local definedDummy
        if game.Players.LocalPlayer.leaderstats.Level.Value < 5000 then
            definedDummy = game.Workspace.MAP["dummies"].Dummy
        else
            definedDummy = game.Workspace.MAP["5k_dummies"].Dummy2
        end
        -- Verifica se o dummy está definido antes de iniciar o loop
        if definedDummy then
            -- Teleporta o jogador para perto do dummy selecionado
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = definedDummy.HumanoidRootPart.CFrame
        end

        -- Inicia o loop de ataque ao dummy enquanto 'attacker' for verdadeiro
        while getgenv().attacker do
            if definedDummy then
                local args = {
                    [1] = "damage",
                    [2] = {
                        ["EnemyHumanoid"] = definedDummy.Humanoid
                    }
                }
                game:GetService("ReplicatedStorage").SkillsInRS.RemoteEvent:FireServer(unpack(args))

                local args1 = {
                    [1] = definedDummy.Humanoid,
                    [2] = 1
                }
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args1))
            end

            wait(0.1)  -- Aguarda um curto período antes da próxima iteração
        end
    end)
end

function viewPerson()
    spawn(function()
        local target = game.Players:FindFirstChild(nameToDamage)

        if target then
            game.Workspace.CurrentCamera.CameraSubject = target.Character:FindFirstChild("Humanoid")
        end 
    end)
end

function teleportBelow()
    spawn(function()
        local playerCharacter = game.Players[nameToDamage].Character
        while getgenv().view == true do
            if playerCharacter then
                local targetPosition = playerCharacter.HumanoidRootPart.Position - Vector3.new(0, 9, 0)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                wait(0.1)
            end
        end
    end)
end

function hitbox()
    spawn(function()
        while getgenv().hitboxEnable do
            for i, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(tamanho_do_penis, tamanho_do_penis, tamanho_do_penis)
                        v.Character.HumanoidRootPart.Transparency = transparencia
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                        v.Character.HumanoidRootPart.Material = Enum.Material.Neon
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
                wait(0.2)
            end
        end
    end)
end

function killAura()
    spawn(function()
        while getgenv().killAura == true do
            local success, error = pcall(function()
                local friendlies = {}
                local Team
                local Teams = game.Workspace.Teams

                for i, v in pairs(Teams:GetDescendants()) do
                    if v:IsA("StringValue") then
                        if v.Value == game.Players.LocalPlayer.Name then
                            Team = tostring(v.Parent.Name)
                        end
                    end
                end

                if Team ~= nil then
                    for i, v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                        if v:IsA("StringValue") then
                            table.insert(friendlies, v.Value)
                        end
                    end
                end

                local PlayerList = {}
                local Min = math.huge

                for i, SearchPlayer in pairs(game.Players:GetChildren()) do
                    if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                        continue
                    end

                    if table.find(friendlies, SearchPlayer.Name) then
                        continue
                    end

                    if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid") and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                        table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})

                        if Min > Mag then
                            Min = Mag
                        end
                    end
                end

                table.sort(PlayerList, function(a, b)
                    return a.Magnitude < b.Magnitude
                end)

                if PlayerList[1] and PlayerList[1].Magnitude < 20 and PlayerList[1].Player and PlayerList[1].Player.Character.Humanoid.Health > 0 then
                    game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(PlayerList[1].Player.Character.Humanoid, "1")
                    print(PlayerList[1].Player.Character.Humanoid.Health .. "/" .. PlayerList[1].Player.Character.Humanoid.MaxHealth)
                end
            end)

            if not success then
                print(error)
            end

            wait(0.1)
        end
    end)
end

function fireAura()
    spawn(function()
        while getgenv().fireAura == true do
            local success, error = pcall(function()
                local friendlies = {}
                local Team
                local Teams = game.Workspace.Teams

                for i, v in pairs(Teams:GetDescendants()) do
                    if v:IsA("StringValue") then
                        if v.Value == game.Players.LocalPlayer.Name then
                            Team = tostring(v.Parent.Name)
                        end
                    end
                end

                if Team ~= nil then
                    for i, v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                        if v:IsA("StringValue") then
                            table.insert(friendlies, v.Value)
                        end
                    end
                end

                local PlayerList = {}
                local Min = math.huge

                for i, SearchPlayer in pairs(game.Players:GetChildren()) do
                    if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                        continue
                    end

                    if table.find(friendlies, SearchPlayer.Name) then
                        continue
                    end

                    if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid") and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                        table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})

                        if Min > Mag then
                            Min = Mag
                        end
                    end
                end

                table.sort(PlayerList, function(a, b)
                    return a.Magnitude < b.Magnitude
                end)

                if PlayerList[1] and PlayerList[1].Magnitude < 20 and PlayerList[1].Player and PlayerList[1].Player.Character.Humanoid.Health > 0 then
                    local targetHumanoid = PlayerList[1].Player.Character.Humanoid
                    game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(targetHumanoid, "1")
                    
                    -- Add the new execution here
                    local args = {
                        [1] = "damage",
                        [2] = {
                            ["EnemyHumanoid"] = targetHumanoid
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    print(targetHumanoid.Health .. "/" .. targetHumanoid.MaxHealth)
                end
            end)

            if not success then
                print(error)
            end

            wait(0.1)
        end
    end)
end

function dealBossDamage()
    spawn(function()
        while getgenv().autoBoss == true do
            local args = {
                [1] = workspace:WaitForChild("NPC"):WaitForChild(bossSelect):WaitForChild("Humanoid"),
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))
            wait()
        end
    end)
end

function instaCentaur()
    spawn(function()
        while true do
            local centaurData = {
                [1] = workspace.NPC.CENTAUR.Humanoid,
                [2] = 1
            }

            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(centaurData))
            workspace.NPC.CENTAUR.Humanoid.Health = 0
            wait()
        end
    end)
end

function instaDragon()
    spawn(function()
        while true do
            local dragonData = {
                [1] = workspace.NPC.DragonGiraffe.Humanoid,
                [2] = 1
            }

            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(dragonData))
            workspace.NPC.DragonGiraffe.Humanoid.Health = 0
            wait()
        end
    end)
end

function instaCrab()
    spawn(function()
        while true do
            local crabData = {
                [1] = workspace.NPC.CRABBOSS.Humanoid,
                [2] = 1
            }

            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(crabData))
            workspace.NPC.CRABBOSS.Humanoid.Health = 0
            wait()
        end
    end)
end

function instaLava()
    spawn(function()
        while true do
            local lavaData = {
                [1] = workspace.NPC.LavaGorilla.Humanoid,
                [2] = 1
            }

            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(lavaData))
            workspace.NPC.LavaGorilla.Humanoid.Health = 0
            wait()
        end
    end)
end

function instaGriffin()
    spawn(function()
        while true do
            local griffinData = {
                [1] = workspace.NPC.Griffin.Humanoid,
                [2] = 1
            }

            game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(griffinData))
            workspace.NPC.Griffin.Humanoid.Health = 0
            wait()
        end
    end)
end

function killBoss()
    spawn(function()
        while getgenv().autoBoss2 == true do
            local args = {
                [1] = workspace:WaitForChild("NPC"):WaitForChild(bossSelect):WaitForChild("Humanoid"),
                [2] = 1
            }
            game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))

            workspace.NPC[bossSelect].Humanoid.Health = 0
            wait()
        end
    end)
end

function dealDamage()
    spawn(function()
        while getgenv().damage == true do
            if nameToDamage ~= "" then
                local targetPlayer = game.Players:FindFirstChild(nameToDamage)
                if targetPlayer then
                    local args = {
                        [1] = targetPlayer.Character.Humanoid,
                        [2] = 2
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli"):FireServer(unpack(args))
                end
            end
            wait(0.1)
        end
    end)
end

function dealFireDamage()
    spawn(function()
        while getgenv().fireDamage == true do
            if nameToDamage ~= "" then
                local targetPlayer = game.Players:FindFirstChild(nameToDamage)
                if targetPlayer then
                    local args = {
                        [1] = "damage",
                        [2] = {
                            ["EnemyHumanoid"] = targetPlayer.Character.Humanoid
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end
            wait(0.1)
        end
    end)
end

Toba = true
