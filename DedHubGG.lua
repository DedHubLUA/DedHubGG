-- Basic Key System GUI (works in Synapse, Fluxus, Delta)

local correctKey = "OWNER-1234567890abcdef"

-- Створюємо меню
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Text = "Enter Key"
title.Size = UDim2.new(1, 0, 0, 30)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Gotham
title.TextSize = 20

local box = Instance.new("TextBox", frame)
box.PlaceholderText = "OWNER-XXXXXXXXXX"
box.Size = UDim2.new(1, -20, 0, 30)
box.Position = UDim2.new(0, 10, 0, 40)
box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
box.TextColor3 = Color3.new(1, 1, 1)
box.Font = Enum.Font.Gotham
box.TextSize = 16

local enter = Instance.new("TextButton", frame)
enter.Text = "Enter"
enter.Size = UDim2.new(0.5, -15, 0, 30)
enter.Position = UDim2.new(0, 10, 0, 80)
enter.BackgroundColor3 = Color3.fromRGB(40, 160, 40)
enter.TextColor3 = Color3.new(1, 1, 1)
enter.Font = Enum.Font.Gotham
enter.TextSize = 16

local getKey = Instance.new("TextButton", frame)
getKey.Text = "Get Key"
getKey.Size = UDim2.new(0.5, -15, 0, 30)
getKey.Position = UDim2.new(0.5, 5, 0, 80)
getKey.BackgroundColor3 = Color3.fromRGB(60, 60, 200)
getKey.TextColor3 = Color3.new(1, 1, 1)
getKey.Font = Enum.Font.Gotham
getKey.TextSize = 16

-- Обробка натискань
enter.MouseButton1Click:Connect(function()
    if box.Text == correctKey then
        frame:Destroy()
        loadstring("print('✅ Script loaded!')")()
    else
        box.Text = ""
        box.PlaceholderText = "❌ Invalid Key"
    end
end)

getKey.MouseButton1Click:Connect(function()
    setclipboard("https://yourkeysite.com") -- заміни на свій сайт
    box.Text = ""
    box.PlaceholderText = "🔗 Link copied!"
end)
