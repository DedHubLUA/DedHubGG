local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DedHub"
gui.Parent = player:WaitForChild("PlayerGui")

local dragging, dragInput, dragStart, startPos

local function makeDraggable(frame)
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = false
mainFrame.Parent = gui

makeDraggable(mainFrame)

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 10)

local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleBar.Text = "Ded Hub  |  Версия 1.0"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.SourceSansBold
titleBar.TextSize = 24
titleBar.Parent = mainFrame

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local easterButton = Instance.new("TextButton")
easterButton.Text = "Easter"
easterButton.Size = UDim2.new(1, 0, 0, 50)
easterButton.Position = UDim2.new(0, 0, 0, 0)
easterButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
easterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
easterButton.Font = Enum.Font.SourceSans
easterButton.TextSize = 20
easterButton.Parent = sidebar

local easterPanel = Instance.new("Frame")
easterPanel.Size = UDim2.new(0, 450, 1, -40)
easterPanel.Position = UDim2.new(0, 150, 0, 40)
easterPanel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
easterPanel.Visible = false
easterPanel.Parent = mainFrame
Instance.new("UICorner", easterPanel).CornerRadius = UDim.new(0, 10)

local shopButton = Instance.new("TextButton")
shopButton.Text = "Easter Shop"
shopButton.Size = UDim2.new(0, 200, 0, 50)
shopButton.Position = UDim2.new(0, 20, 0, 20)
shopButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
shopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
shopButton.Font = Enum.Font.SourceSans
shopButton.TextSize = 18
shopButton.Parent = easterPanel
Instance.new("UICorner", shopButton).CornerRadius = UDim.new(0, 6)

local bottomMessage = Instance.new("TextLabel")
bottomMessage.Size = UDim2.new(1, 0, 0, 30)
bottomMessage.Position = UDim2.new(0, 0, 1, -30)
bottomMessage.BackgroundTransparency = 1
bottomMessage.TextColor3 = Color3.fromRGB(255, 80, 80)
bottomMessage.Text = ""
bottomMessage.Font = Enum.Font.SourceSansItalic
bottomMessage.TextSize = 18
bottomMessage.Parent = gui

easterButton.MouseButton1Click:Connect(function()
	easterPanel.Visible = not easterPanel.Visible
end)

shopButton.MouseButton1Click:Connect(function()
	local guiToShow = workspace:FindFirstChild("OwnerTag") and workspace.OwnerTag:FindFirstChild("Part1") and workspace.OwnerTag.Part1:FindFirstChild("BillboardGUI")
	if guiToShow then
		guiToShow.Enabled = true
		bottomMessage.Text = "GUI включен"
	else
		bottomMessage.Text = "GUI не найден"
	end
	wait(2)
	bottomMessage.Text = ""
end)

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 40, 0, 40)
minimizeButton.Position = UDim2.new(1, -40, 0, 0)
minimizeButton.Text = "-"
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeButton.TextSize = 24
minimizeButton.Parent = mainFrame

minimizeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	wait(0.2)
	mainFrame.Visible = true
end)
