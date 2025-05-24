-- Создание экрана
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DedHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Основная панель
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Название и версия
local Title = Instance.new("TextLabel")
Title.Text = "Ded Hub  |  Версия 1.0"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.Parent = MainFrame

-- Боковая панель
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 150, 1, -40)
SideBar.Position = UDim2.new(0, 0, 0, 40)
SideBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

-- Кнопка Easter
local EasterButton = Instance.new("TextButton")
EasterButton.Text = "Easter"
EasterButton.Size = UDim2.new(1, 0, 0, 50)
EasterButton.Position = UDim2.new(0, 0, 0, 0)
EasterButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
EasterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EasterButton.Font = Enum.Font.SourceSans
EasterButton.TextSize = 20
EasterButton.Parent = SideBar

-- Панель для кнопки Easter Shop
local EasterPanel = Instance.new("Frame")
EasterPanel.Size = UDim2.new(0, 450, 1, -40)
EasterPanel.Position = UDim2.new(0, 150, 0, 40)
EasterPanel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
EasterPanel.Visible = false
EasterPanel.Parent = MainFrame

-- Кнопка Easter Shop
local EasterShopButton = Instance.new("TextButton")
EasterShopButton.Text = "Easter Shop"
EasterShopButton.Size = UDim2.new(0, 200, 0, 50)
EasterShopButton.Position = UDim2.new(0, 20, 0, 20)
EasterShopButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
EasterShopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EasterShopButton.Font = Enum.Font.SourceSans
EasterShopButton.TextSize = 18
EasterShopButton.Parent = EasterPanel

-- Метка "don't work"
local NotWorkingLabel = Instance.new("TextLabel")
NotWorkingLabel.Text = "don't work"
NotWorkingLabel.Size = UDim2.new(0, 200, 0, 30)
NotWorkingLabel.Position = UDim2.new(0, 20, 0, 80)
NotWorkingLabel.BackgroundTransparency = 1
NotWorkingLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
NotWorkingLabel.Font = Enum.Font.SourceSansItalic
NotWorkingLabel.TextSize = 16
NotWorkingLabel.Parent = EasterPanel

-- Функциональность кнопки Easter
EasterButton.MouseButton1Click:Connect(function()
	EasterPanel.Visible = not EasterPanel.Visible
end)
