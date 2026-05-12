local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("MI MENU PRO v1", "Midnight")

-- Pestaña Principal
local Tab1 = Window:NewTab("Combate")
local Section1 = Tab1:NewSection("Poderes")

Section1:NewButton("PERM GOD (Inmortal)", "Nadie puede hacerte daño", function()
    -- Este es un script básico de God Mode
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
    end
    print("Modo Dios activado")
end)

Section1:NewButton("KILL ALL (Matar a todos)", "Elimina a los otros jugadores", function()
    -- Nota: Esto no funciona en todos los juegos por el filtrado
    for i, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            v.Character.Humanoid.Health = 0
        end
    end
end)

-- Pestaña de Movimiento
local Tab2 = Window:NewTab("Movimiento")
local Section2 = Tab2:NewSection("Ajustes")

Section2:NewSlider("Velocidad", "Ajusta tu rapidez", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section2:NewButton("Super Salto", "Saltar muy alto", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)
