local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("MY MENU PRO v1", "Midnight")

-- Pestaña Principal
local Tab1 = Window:NewTab("Main")
local Section1 = Tab1:NewSection("Combat Functions")

Section1:NewButton("GOD MODE", "Makes you immortal", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
    end
end)

Section1:NewButton("KILL ALL", "Eliminates every player", function()
    for i, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") then
                v.Character.Humanoid.Health = 0
            end
        end
    end
end)

-- Pestaña de Jugadores
local Tab2 = Window:NewTab("Players")
local Section2 = Tab2:NewSection("Server List")

for i, v in pairs(game.Players:GetPlayers()) do
    Section2:NewLabel("User: " .. v.Name)
end
