local O = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
local L = loadstring or load

if game.PlaceId == 5712833750 then
    L(game:HttpGet("https://raw.githubusercontent.com/gabrelso/TobaHub/refs/heads/main/AnimalSimulator.lua"))()
elseif game.PlaceId == 16432271978 then
    L(game:HttpGet("https://raw.githubusercontent.com/gabrelso/TobaHub/refs/heads/main/AnimalAdventures.lua"))()
else
    O:MakeNotification({
        Name = "Game not supported!",
        Content = "Supported games: Animal Simulator, Animal Adventures.",
        Image = "rbxassetid://4483345998",
        Time = 7
    })
end
