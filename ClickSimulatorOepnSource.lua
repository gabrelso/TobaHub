-- [[ por __zgab ]]
-- [[ open source e mal feito uau ]]
-- [[ amamos o ruan do cuzao enorme ]]



-- boot up
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Roblox/master/Orion.lua", true))()

local Window = OrionLib:MakeWindow({Name = "Click Simulator", TestMode = false, SaveConfig = false, ConfigFolder = "OrionTest"})


local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    TestersOnly = false
})

local Tab1 = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    TestersOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Eggs",
    Icon = "rbxassetid://4483345998",
    TestersOnly = false
})

-- variáveis e etc
getgenv().click = false
getgenv().rebirth = false
getgenv().eggs = false
local selectedEgg = ""

local Section = Tab:AddSection({
    Name = "Feito por __zgab sem motivo aparente"
})

local Section1 = Tab:AddSection({
    Name = "Te amo Ruan delicia"
})


-- opções fudidas
Tab1:AddToggle({
    Name = "Auto Clicker",
    Default = false,
    Callback = function(Value)
        getgenv().click = Value
        if Value then
            clicker()
        end
    end 
})


Tab1:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        getgenv().rebirth = Value
        if Value then
            rebirth()
        end
    end 
})


Tab2:AddDropdown({
    Name = "Select Egg",
    Default = "",
    Options = {"Tech Egg", "Lava Egg"},
    Callback = function(Value)
        print(Value)
        selectedEgg = Value
    end    
})


Tab2:AddToggle({
    Name = "Auto Eggs",
    Default = false,
    Callback = function(Value)
        getgenv().eggs = Value
        if Value then
            eggs()
        end
    end 
})


-- funções podres
function clicker()
    spawn(function()
        while getgenv().click == true do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Clicker"):FireServer()
            wait()
        end
    end)
end

function rebirth()
    spawn(function()
        while getgenv().rebirth == true do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Rebirth"):FireServer()
            wait()
        end
    end)
end

function eggs()
    spawn(function()
        while getgenv().eggs == true do
            local args = {
                [1] = selectedEgg,
                [2] = 1
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Egg"):InvokeServer(unpack(args))
            wait()
        end
    end)
end
