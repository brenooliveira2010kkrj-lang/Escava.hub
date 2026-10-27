
--[[
    ESCAVA HUB
    Interface personalizada
    Tema: Preto e Roxo
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Evita duplicar a interface
local oldGui = playerGui:FindFirstChild("EscavaHub")
if oldGui then
    oldGui:Destroy()
end

-- Cores do hub
local BLACK = Color3.fromRGB(15, 12, 20)
local PANEL = Color3.fromRGB(25, 20, 34)
local PURPLE = Color3.fromRGB(145, 65, 255)
local WHITE = Color3.fromRGB(245, 240, 255)
local GRAY = Color3.fromRGB(170, 160, 185)

-- Interface principal
local gui = Instance.new("ScreenGui")
gui.Name = "EscavaHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 10
gui.Parent = playerGui

-- Botão flutuante
local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Size = UDim2.fromOffset(58, 58)
openButton.Position = UDim2.new(0, 18, 0.5, -29)
openButton.BackgroundColor3 = PURPLE
openButton.Text = "E"
openButton.TextColor3 = WHITE
openButton.TextSize = 28
openButton.Font = Enum.Font.GothamBold
openButton.Parent = gui

Instance.new("UICorner", openButton).CornerRadius =
    UDim.new(1, 0)

local openStroke = Instance.new("UIStroke")
openStroke.Color = WHITE
openStroke.Thickness = 1.5
openStroke.Parent = openButton

-- Janela principal
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 340, 0, 270)
main.Position = UDim2.new(0.5, -170, 0.5, -135)
main.BackgroundColor3 = BLACK
main.BorderSizePixel = 0
main.Visible = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local stroke = Instance.new("UIStroke")
stroke.Color = PURPLE
stroke.Thickness = 2
stroke.Parent = main

-- Cabeçalho
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 58)
header.BackgroundColor3 = PANEL
header.BorderSizePixel = 0
header.Parent = main

Instance.new("UICorner", header).CornerRadius =
    UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 0, 30)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = "ESCAVA HUB"
title.TextColor3 = PURPLE
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -65, 0, 18)
subtitle.Position = UDim2.new(0, 16, 0, 33)
subtitle.BackgroundTransparency = 1
subtitle.Text = "ROUBE UM OVO  •  CUSTOM UI"
subtitle.TextColor3 = GRAY
subtitle.TextSize = 10
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

-- Botão fechar
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromOffset(35, 35)
closeButton.Position = UDim2.new(1, -44, 0, 11)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 30, 75)
closeButton.Text = "X"
closeButton.TextColor3 = WHITE
closeButton.TextSize = 16
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = header

Instance.new("UICorner", closeButton).CornerRadius =
    UDim.new(0, 8)

-- Conteúdo
local section = Instance.new("TextLabel")
section.Size = UDim2.new(1, -30, 0, 25)
section.Position = UDim2.new(0, 15, 0, 72)
section.BackgroundTransparency = 1
section.Text = "PAINEL PRINCIPAL"
section.TextColor3 = WHITE
section.TextSize = 14
section.Font = Enum.Font.GothamBold
section.TextXAlignment = Enum.TextXAlignment.Left
section.Parent = main

local description = Instance.new("TextLabel")
description.Size = UDim2.new(1, -30, 0, 48)
description.Position = UDim2.new(0, 15, 0, 101)
description.BackgroundTransparency = 1
description.Text = "Bem-vindo ao Escava Hub!\\nSua interface personalizada está pronta."
description.TextColor3 = GRAY
description.TextSize = 12
description.Font = Enum.Font.Gotham
description.TextWrapped = true
description.TextXAlignment = Enum.TextXAlignment.Left
description.Parent = main

-- Botão de informação
local infoButton = Instance.new("TextButton")
infoButton.Size = UDim2.new(1, -30, 0, 42)
infoButton.Position = UDim2.new(0, 15, 0, 165)
infoButton.BackgroundColor3 = PANEL
infoButton.Text = "  ✦  Sobre o Escava Hub"
infoButton.TextColor3 = WHITE
infoButton.TextSize = 13
infoButton.Font = Enum.Font.GothamSemibold
infoButton.TextXAlignment = Enum.TextXAlignment.Left
infoButton.Parent = main

Instance.new("UICorner", infoButton).CornerRadius =
    UDim.new(0, 8)

local infoStroke = Instance.new("UIStroke")
infoStroke.Color = PURPLE
infoStroke.Thickness = 1
infoStroke.Parent = infoButton

infoButton.Activated:Connect(function()
    description.Text =
        "ESCAVA HUB | Versão 1.0\\nInterface visual para Roube um Ovo."
end)

-- Rodapé
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, -30, 0, 22)
footer.Position = UDim2.new(0, 15, 1, -29)
footer.BackgroundTransparency = 1
footer.Text = "ESCAVA HUB  •  V1.0"
footer.TextColor3 = PURPLE
footer.TextSize = 10
footer.Font = Enum.Font.GothamBold
footer.TextXAlignment = Enum.TextXAlignment.Center
footer.Parent = main

-- Abrir e fechar
local function toggleMenu()
    main.Visible = not main.Visible
end

openButton.Activated:Connect(toggleMenu)

closeButton.Activated:Connect(function()
    main.Visible = false
end)

-- Animação simples
main.BackgroundTransparency = 1
TweenService:Create(
    main,
    TweenInfo.new(0.35, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 0}
):Play()

print("ESCAVA HUB carregado!")
