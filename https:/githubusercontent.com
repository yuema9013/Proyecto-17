local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("MI MENU PRO", "Midnight")

local Tab = Window:NewTab("Principal")
local Section = Tab:NewSection("Trampas")

Section:NewButton("Super Velocidad", "Correr rapido", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

Section:NewButton("Super Salto", "Saltar alto", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)
