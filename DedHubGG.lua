local flying = false
local connection

flyButton.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	if flying then
		flying = false
		if connection then
			connection:Disconnect()
		end
		hrp.Velocity = Vector3.zero
		hrp.Anchored = false
		flyButton.Text = "Активировать полет"
	else
		flying = true
		hrp.Anchored = false
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local cam = workspace.CurrentCamera
			local moveDirection = Vector3.zero
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				moveDirection += cam.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				moveDirection -= cam.CFrame.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				moveDirection -= cam.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				moveDirection += cam.CFrame.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				moveDirection += Vector3.new(0, 1, 0)
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				moveDirection -= Vector3.new(0, 1, 0)
			end
			hrp.Velocity = moveDirection.Unit * 50
		end)
		flyButton.Text = "Выключить полет"
	end
end)
