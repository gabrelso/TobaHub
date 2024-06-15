local RemoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Queue to manage players to attack
local attackQueue = {}

-- Function to execute attack script
local function executeAttack(targetPlayer)
    -- Check if the player has a force field
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("ForceField") then
        return false  -- Skip this player if they have a force field
    end
    
    -- Check if the player's character and humanoid are valid
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local args = {
            [1] = "damage",
            [2] = {
                ["EnemyHumanoid"] = targetPlayer.Character.Humanoid
            }
        }
        
        RemoteEvent:FireServer(unpack(args))  -- Fire the attack event
        return true  -- Successfully attacked
    else
        return false  -- Unable to attack this player (character or humanoid not available)
    end
end

-- Function to add player to attack queue
local function addToAttackQueue(player)
    table.insert(attackQueue, player)
end

-- Infinite loop to continuously attack players in the attack queue
while true do
    -- Add all players (except local player and those with force field) to attack queue
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer and (not player.Character or not player.Character:FindFirstChild("ForceField")) then
            addToAttackQueue(player)
        end
    end
    
    -- Process one player from the attack queue per iteration
    if #attackQueue > 0 then
        local playerToAttack = table.remove(attackQueue, 1)  -- Get and remove the first player from the queue
        local success = executeAttack(playerToAttack)  -- Execute attack for this player
        
        -- Handle case where attack failed (possibly due to player's character not being available)
        if not success then
            -- Re-add the player to the queue for another attempt later
            addToAttackQueue(playerToAttack)
        end
    end
    
    wait(1)  -- Introduce a 1-second delay before the next iteration
end
