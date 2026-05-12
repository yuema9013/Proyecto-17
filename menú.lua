-- Usamos la librería Kavo para que el menú se vea bien
local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("MI MENU PRO v1", "Midnight")

-- Pestaña Principal
local Tab1 = Window:NewTab("Combate")
local Section1 = Tab1:NewSection("Poderes")

Section1:NewButton("DIOS PERMANENTE (Inmortal)", "Nadie puede hacerte daño", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
    end
end)

Section1:NewButton("MATAR A TODOS", "Elimina a los otros jugadores", function()
    for i, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") then
                v.Character.Humanoid.Health = 0
            end
        end
    end
end)

-- Pestaña de Jugadores (Para ver los nombres en el menú)
local Tab2 = Window:NewTab("Lista Jugadores")
local Section2 = Tab2:NewSection("Nombres en el Servidor")

for i, v in pairs(game.Players:GetPlayers()) do
    Section2:NewLabel("👤 " .. v.Name)
end
