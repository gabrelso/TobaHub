local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RemoteEvent = game:GetService("ReplicatedStorage").SkillsInRS.RemoteEvent

-- Queue to manage players to attack
local attackQueue = {}

-- Function to add player to attack queue
local function addToAttackQueue(player)
    table.insert(attackQueue, player)
end

-- Infinite loop to continuously attack players
while true do
    wait(0.0001)  -- Adjusted wait time for faster execution
    
    local players = Players:GetPlayers()
    
    -- Remove local player and players with force fields from the list
    for i = #players, 1, -1 do
        local p = players[i]
        if p == LocalPlayer or (p.Character and p.Character:FindFirstChild("ForceField")) then
            table.remove(players, i)
        end
    end
    
    -- Add remaining players to attack queue
    for _, player in ipairs(players) do
        addToAttackQueue(player)
    end
    
    -- Process one player from the attack queue per iteration
    if #attackQueue > 0 then
        local playerToAttack = table.remove(attackQueue, 1)
        
        -- Check if playerToAttack is valid to attack
        if playerToAttack and playerToAttack.Character and playerToAttack.Character:FindFirstChild("Humanoid") then
            local args = {
                [1] = "damage",
                [2] = {
                    ["EnemyHumanoid"] = playerToAttack.Character.Humanoid
                }
            }
            RemoteEvent:FireServer(unpack(args))
        end
        
        wait(0.0001)  -- Adding a small delay between attacks
    end
end
