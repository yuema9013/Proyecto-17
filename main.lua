-- ==========================================
-- INTERFAZ GRÁFICA (GUI) PARA ARCEUS X NEO
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local PlayerInput = Instance.new("TextBox")
local Grid = Instance.new("UIGridLayout")
local ButtonFrame = Instance.new("Frame")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "AdminMenuDB"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Title.Text = "PROYECTO 17 - DB ADMIN"
Title.TextColor3 = Color3.fromRGB(255, 140, 0)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold

PlayerInput.Parent = MainFrame
PlayerInput.PlaceholderText = "Nombre del jugador objetivo..."
PlayerInput.Size = UDim2.new(0.9, 0, 0, 35)
PlayerInput.Position = UDim2.new(0.05, 0, 0.12, 0)
PlayerInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
PlayerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerInput.Text = ""
PlayerInput.TextSize = 14

ButtonFrame.Parent = MainFrame
ButtonFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
ButtonFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
ButtonFrame.BackgroundTransparency = 1

Grid.Parent = ButtonFrame
Grid.CellSize = UDim2.new(0, 150, 0, 40)
Grid.CellPadding = UDim2.new(0, 10, 0, 10)

-- Función para buscar jugador objetivo por nombre corto
local function getTargetPlayer()
    local text = PlayerInput.Text:lower()
    if text == "" then return nil end
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #text) == text or (plr.DisplayName and plr.DisplayName:lower():sub(1, #text) == text) then
            return plr
        end
    end
    return nil
end

-- Creador automático de botones
local function createButton(name, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ButtonFrame
    btn.Text = name
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    
    btn.MouseButton1Click:Connect(function()
        local target = getTargetPlayer()
        callback(target)
    end)
end

-- ==========================================
--        LÓGICA CON TUS REMOTOS DEL DEX
-- ==========================================
local BindableEvents = game:GetService("ReplicatedStorage"):WaitForChild("_BindableEvents")
local FznRemote = BindableEvents:WaitForChild("Fzn")
local DamageRemote = BindableEvents:WaitForChild("ForDamageShow")

-- 1. Botón KILL
createButton("KILL", Color3.fromRGB(180, 40, 40), function(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        DamageRemote:FireServer(target.Character.Humanoid, math.huge)
    end
end)

-- 2. Botón HK (Hakai usando el remoto Fzn)
createButton("HK (Hakai)", Color3.fromRGB(120, 40, 160), function(target)
    if target then
        FznRemote:FireServer(target)
    end
end)

-- 3. Botón KILLER (Activa/Desactiva matar a los que se acerquen)
local killerActive = false
createButton("KILLER (Tog)", Color3.fromRGB(200, 100, 0), function()
    killerActive = not killerActive
    if killerActive then
        task.spawn(function()
            while killerActive do
                task.wait(0.3)
                local lp = game.Players.LocalPlayer
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Humanoid") then
                        local dist = (lp.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 25 then
                            DamageRemote:FireServer(plr.Character.Humanoid, math.huge)
                        end
                    end
                end
            end
        end)
    end
end)

-- 4. Botón PERMGOD
createButton("PERMGOD", Color3.fromRGB(40, 150, 40), function()
    local lp = game.Players.LocalPlayer
    FznRemote:FireServer(lp, true)
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.MaxHealth = math.huge
        lp.Character.Humanoid.Health = math.huge
    end
end)
