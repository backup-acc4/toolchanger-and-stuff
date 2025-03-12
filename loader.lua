-- free at last... --
--- finished and working on page 2. ---
---reworked things---
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "toolchangergui"
screenGui.Parent = CoreGui
local activeUI = nil
local function makeDraggable(frame)
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local dragging = true
			local dragStart = input.Position
			local startPos = frame.Position
			frame.InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					local delta = input.Position - dragStart
					frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				end
			end)
			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)
		end
	end)
end
local function tweenOutAndDestroy(uiElement, duration, callback)
	duration = duration or 0.5
	local tween = TweenService:Create(uiElement, TweenInfo.new(duration, Enum.EasingStyle.Quad), {Size = UDim2.new(0,0,0,0)})
	tween:Play()
	tween.Completed:Connect(function()
		uiElement:Destroy()
		if callback then callback() end
	end)
end
local function tweenIn(uiElement, targetSize, duration)
	duration = duration or 0.5
	uiElement.Size = UDim2.new(0,0,0,0)
	local tween = TweenService:Create(uiElement, TweenInfo.new(duration, Enum.EasingStyle.Quad), {Size = targetSize})
	tween:Play()
end
local function showChangeResult(msg)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0,200,0,50)
	label.BackgroundTransparency = 0.5
	label.BackgroundColor3 = Color3.new(0,0,0)
	label.TextColor3 = Color3.new(1,1,1)
	label.Font = Enum.Font.SourceSans
	label.TextScaled = true
	label.Text = msg
	label.BorderSizePixel = 0
	label.Parent = screenGui
	local pos = mainFrame.AbsolutePosition + Vector2.new(0, mainFrame.AbsoluteSize.Y + 10)
	label.Position = UDim2.new(0, pos.X, 0, pos.Y)
	delay(2, function()
		local tween = TweenService:Create(label, TweenInfo.new(2, Enum.EasingStyle.Linear), {TextTransparency = 1, BackgroundTransparency = 1})
		tween:Play()
		tween.Completed:Connect(function() label:Destroy() end)
	end)
end
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,500,0,420)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
makeDraggable(mainFrame)
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0,10)
mainCorner.Parent = mainFrame
local expandedSize = UDim2.new(0,500,0,420)
local minimizedSize = UDim2.new(0,500,0,50)
local isMinimized = false
local expandTween = TweenService:Create(mainFrame, TweenInfo.new(1, Enum.EasingStyle.Quad), {Size = expandedSize})
expandTween:Play()
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1,0,1,0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "toolchanger revisited, by interactable."
loadingText.TextColor3 = Color3.fromRGB(180,180,180)
loadingText.Font = Enum.Font.SourceSans
loadingText.TextScaled = true
loadingText.TextXAlignment = Enum.TextXAlignment.Center
loadingText.TextYAlignment = Enum.TextYAlignment.Center
loadingText.TextTransparency = 1
loadingText.Parent = mainFrame
local fadeInTween = TweenService:Create(loadingText, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 0})
fadeInTween:Play()
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,50,0,25)
closeButton.Position = UDim2.new(1,-55,0,10)
closeButton.Text = "close"
closeButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.Font = Enum.Font.SourceSans
closeButton.TextScaled = true
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0,50,0,25)
minimizeButton.Position = UDim2.new(1,-120,0,10)
minimizeButton.Text = "minimize"
minimizeButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
minimizeButton.TextColor3 = Color3.fromRGB(255,255,255)
minimizeButton.Font = Enum.Font.SourceSans
minimizeButton.TextScaled = true
minimizeButton.Parent = mainFrame
minimizeButton.MouseButton1Click:Connect(function()
	if not isMinimized then
		local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = minimizedSize})
		tween:Play()
		isMinimized = true
		buttonContainer.Visible = false
	else
		local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = expandedSize})
		tween:Play()
		isMinimized = false
		buttonContainer.Visible = true
	end
end)
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1,0,1,0)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame
local failsafeLabel = Instance.new("TextLabel")
failsafeLabel.Size = UDim2.new(1,0,1,0)
failsafeLabel.BackgroundTransparency = 1
failsafeLabel.Text = "to continune using, close the current ui (failsafe mechanic.)"
failsafeLabel.TextColor3 = Color3.fromRGB(255,255,255)
failsafeLabel.Font = Enum.Font.SourceSans
failsafeLabel.TextScaled = true
failsafeLabel.Visible = false
failsafeLabel.Parent = mainFrame
local function updateMainUIState()
	if activeUI then
		buttonContainer.Visible = false
		failsafeLabel.Visible = true
	else
		failsafeLabel.Visible = false
		buttonContainer.Visible = true
	end
end
local function runInvisScript()
	local ScriptStarted = false
	local Keybind = "E"
	local Transparency = true
	local NoClip = false
	local Player = game:GetService("Players").LocalPlayer
	local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
	local IsInvisible = false
	RealCharacter.Archivable = true
	local FakeCharacter = RealCharacter:Clone()
	local Part = Instance.new("Part", workspace)
	Part.Anchored = true
	Part.Size = Vector3.new(200, 1, 200)
	Part.CFrame = CFrame.new(0, -500, 0)
	Part.CanCollide = true
	FakeCharacter.Parent = workspace
	FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
	for i, v in pairs(RealCharacter:GetChildren()) do
		if v:IsA("LocalScript") then
			local clone = v:Clone()
			clone.Disabled = true
			clone.Parent = FakeCharacter
		end
	end
	if Transparency then
		for i, v in pairs(FakeCharacter:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0.7
			end
		end
	end
	local CanInvis = true
	local function RealCharacterDied()
		CanInvis = false
		RealCharacter:Destroy()
		RealCharacter = Player.Character
		CanInvis = true
		IsInvisible = false
		FakeCharacter:Destroy()
		workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
		RealCharacter.Archivable = true
		FakeCharacter = RealCharacter:Clone()
		Part:Destroy()
		Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Size = Vector3.new(200, 1, 200)
		Part.CFrame = CFrame.new(9999, 9999, 9999)
		Part.CanCollide = true
		FakeCharacter.Parent = workspace
		FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		for i, v in pairs(RealCharacter:GetChildren()) do
			if v:IsA("LocalScript") then
				local clone = v:Clone()
				clone.Disabled = true
				clone.Parent = FakeCharacter
			end
		end
		if Transparency then
			for i, v in pairs(FakeCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.7
				end
			end
		end
		RealCharacter.Humanoid.Died:Connect(function()
			RealCharacter:Destroy()
			FakeCharacter:Destroy()
		end)
		Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	end
	RealCharacter.Humanoid.Died:Connect(function()
		RealCharacter:Destroy()
		FakeCharacter:Destroy()
	end)
	Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	local PseudoAnchor
	game:GetService("RunService").RenderStepped:Connect(function()
		if PseudoAnchor ~= nil then
			PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		end
		if NoClip then
			FakeCharacter.Humanoid:ChangeState(11)
		end
	end)
	PseudoAnchor = FakeCharacter.HumanoidRootPart
	local function Invisible()
		if IsInvisible == false then
			local StoredCF = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = StoredCF
			RealCharacter.Humanoid:UnequipTools()
			Player.Character = FakeCharacter
			workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
			PseudoAnchor = RealCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = false
				end
			end
			IsInvisible = true
		else
			local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = StoredCF
			FakeCharacter.Humanoid:UnequipTools()
			Player.Character = RealCharacter
			workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
			PseudoAnchor = FakeCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = true
				end
			end
			IsInvisible = false
		end
	end
	game:GetService("UserInputService").InputBegan:Connect(function(key, gamep)
		if gamep then return end
		if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
			if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
				Invisible()
			end
		end
	end)
	local Sound = Instance.new("Sound", game:GetService("SoundService"))
	Sound.SoundId = "rbxassetid://232127604"
	Sound:Play()
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = "loaded lmao", Text = "press e to invis!!!", Duration = 20, Button1 = "Okay."})
end
local function runFlingScript()
	local speaker = Players.LocalPlayer
	local function getRoot(character)
		return character and character:FindFirstChild("HumanoidRootPart")
	end
	local humanoid = speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid")
	local isDead = false
	if humanoid then
		humanoid.Died:Connect(function()
			isDead = true
			execCmd("unwalkfling")
		end)
	end
	execCmd("noclip nonotify")
	walkflinging = true
	repeat 
		RunService.Heartbeat:Wait()
		local character = speaker.Character
		local root = getRoot(character)
		local vel, movel = nil, 0.1
		while not (character and character.Parent and root and root.Parent) do
			RunService.Heartbeat:Wait()
			character = speaker.Character
			root = getRoot(character)
		end
		vel = root.Velocity
		root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
		RunService.RenderStepped:Wait()
		if character and character.Parent and root and root.Parent then
			root.Velocity = vel
		end
		RunService.Stepped:Wait()
		if character and character.Parent and root and root.Parent then
			root.Velocity = vel + Vector3.new(0, movel, 0)
			movel = movel * -1
		end
	until isDead
end
local function runPage2Script()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/backup-acc4/toolchanger-and-stuff/refs/heads/main/function2.lua"))()
end
delay(5, function()
	local fadeOutTween = TweenService:Create(loadingText, TweenInfo.new(1, Enum.EasingStyle.Linear), {TextTransparency = 1})
	fadeOutTween:Play()
	fadeOutTween.Completed:Connect(function()
		loadingText:Destroy()
		local newToolButton = Instance.new("TextButton")
		newToolButton.Name = "newToolButton"
		newToolButton.Size = UDim2.new(0,120,0,40)
		newToolButton.Position = UDim2.new(0.5,0,0.125,0)
		newToolButton.AnchorPoint = Vector2.new(0.5,0.5)
		newToolButton.Text = "new tool"
		newToolButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		newToolButton.TextColor3 = Color3.fromRGB(255,255,255)
		newToolButton.Font = Enum.Font.SourceSans
		newToolButton.TextScaled = true
		newToolButton.Parent = buttonContainer
		local openTextButton = Instance.new("TextButton")
		openTextButton.Name = "openTextButton"
		openTextButton.Size = UDim2.new(0,120,0,40)
		openTextButton.Position = UDim2.new(0.5,0,0.25,0)
		openTextButton.AnchorPoint = Vector2.new(0.5,0.5)
		openTextButton.Text = "open ui text changer"
		openTextButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		openTextButton.TextColor3 = Color3.fromRGB(255,255,255)
		openTextButton.Font = Enum.Font.SourceSans
		openTextButton.TextScaled = true
		openTextButton.Parent = buttonContainer
		local hipheightButton = Instance.new("TextButton")
		hipheightButton.Name = "hipheightButton"
		hipheightButton.Size = UDim2.new(0,120,0,40)
		hipheightButton.Position = UDim2.new(0.5,0,0.375,0)
		hipheightButton.AnchorPoint = Vector2.new(0.5,0.5)
		hipheightButton.Text = "hipheight changer"
		hipheightButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		hipheightButton.TextColor3 = Color3.fromRGB(255,255,255)
		hipheightButton.Font = Enum.Font.SourceSans
		hipheightButton.TextScaled = true
		hipheightButton.Parent = buttonContainer
		local teleportButton = Instance.new("TextButton")
		teleportButton.Name = "teleportButton"
		teleportButton.Size = UDim2.new(0,120,0,40)
		teleportButton.Position = UDim2.new(0.5,0,0.5,0)
		teleportButton.AnchorPoint = Vector2.new(0.5,0.5)
		teleportButton.Text = "player teleport"
		teleportButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		teleportButton.TextColor3 = Color3.fromRGB(255,255,255)
		teleportButton.Font = Enum.Font.SourceSans
		teleportButton.TextScaled = true
		teleportButton.Parent = buttonContainer
		local f3xButton = Instance.new("TextButton")
		f3xButton.Name = "f3xButton"
		f3xButton.Size = UDim2.new(0,120,0,40)
		f3xButton.Position = UDim2.new(0.5,0,0.625,0)
		f3xButton.AnchorPoint = Vector2.new(0.5,0.5)
		f3xButton.Text = "f3x"
		f3xButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		f3xButton.TextColor3 = Color3.fromRGB(255,255,255)
		f3xButton.Font = Enum.Font.SourceSans
		f3xButton.TextScaled = true
		f3xButton.Parent = buttonContainer
		f3xButton.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
		end)
		local invisButton = Instance.new("TextButton")
		invisButton.Name = "invisButton"
		invisButton.Size = UDim2.new(0,120,0,40)
		invisButton.Position = UDim2.new(0.5,0,0.75,0)
		invisButton.AnchorPoint = Vector2.new(0.5,0.5)
		invisButton.Text = "invis"
		invisButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		invisButton.TextColor3 = Color3.fromRGB(255,255,255)
		invisButton.Font = Enum.Font.SourceSans
		invisButton.TextScaled = true
		invisButton.Parent = buttonContainer
		invisButton.MouseButton1Click:Connect(function()
			runInvisScript()
		end)
		local flingButton = Instance.new("TextButton")
		flingButton.Name = "flingButton"
		flingButton.Size = UDim2.new(0,120,0,40)
		flingButton.Position = UDim2.new(0.5,0,0.875,0)
		flingButton.AnchorPoint = Vector2.new(0.5,0.5)
		flingButton.Text = "fling"
		flingButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		flingButton.TextColor3 = Color3.fromRGB(255,255,255)
		flingButton.Font = Enum.Font.SourceSans
		flingButton.TextScaled = true
		flingButton.Parent = buttonContainer
		flingButton.MouseButton1Click:Connect(function()
			runFlingScript()
		end)
		local page2Button = Instance.new("TextButton")
		page2Button.Name = "page2Button"
		page2Button.Size = UDim2.new(0,120,0,40)
		page2Button.Position = UDim2.new(1,-10,0,10)
		page2Button.AnchorPoint = Vector2.new(1,0)
		page2Button.Text = "page 2"
		page2Button.BackgroundColor3 = Color3.fromRGB(50,50,50)
		page2Button.TextColor3 = Color3.fromRGB(255,255,255)
		page2Button.Font = Enum.Font.SourceSans
		page2Button.TextScaled = true
		page2Button.Parent = mainFrame
		page2Button.MouseButton1Click:Connect(function()
			runPage2Script()
		end)
		local function openNewToolUI()
			if activeUI then return end
			local newToolUI = Instance.new("Frame")
			newToolUI.Name = "newToolUI"
			newToolUI.Size = UDim2.new(0,300,0,80)
			newToolUI.Position = UDim2.new(1,10,0.5,-40)
			newToolUI.BackgroundColor3 = Color3.fromRGB(40,40,40)
			newToolUI.Parent = mainFrame
			makeDraggable(newToolUI)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0,10)
			uiCorner.Parent = newToolUI
			local closeNewTool = Instance.new("TextButton")
			closeNewTool.Size = UDim2.new(0,50,0,25)
			closeNewTool.Position = UDim2.new(1,-55,0,5)
			closeNewTool.Text = "close"
			closeNewTool.BackgroundColor3 = Color3.fromRGB(70,70,70)
			closeNewTool.TextColor3 = Color3.fromRGB(255,255,255)
			closeNewTool.Font = Enum.Font.SourceSans
			closeNewTool.TextScaled = true
			closeNewTool.Parent = newToolUI
			closeNewTool.MouseButton1Click:Connect(function()
				tweenOutAndDestroy(newToolUI, 0.5, function()
					activeUI = nil
					updateMainUIState()
				end)
			end)
			local toolBox = Instance.new("TextBox")
			toolBox.Size = UDim2.new(0,200,0,30)
			toolBox.Position = UDim2.new(0,10,0,40)
			toolBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
			toolBox.TextColor3 = Color3.fromRGB(255,255,255)
			toolBox.Font = Enum.Font.SourceSans
			toolBox.TextScaled = true
			toolBox.PlaceholderText = "tool name"
			toolBox.Parent = newToolUI
			local createButton = Instance.new("TextButton")
			createButton.Size = UDim2.new(0,80,0,30)
			createButton.Position = UDim2.new(0,220,0,40)
			createButton.Text = "create"
			createButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
			createButton.TextColor3 = Color3.fromRGB(255,255,255)
			createButton.Font = Enum.Font.SourceSans
			createButton.TextScaled = true
			createButton.Parent = newToolUI
			createButton.MouseButton1Click:Connect(function()
				local toolName = toolBox.Text
				if toolName == "" then toolName = "new tool" end
				local player = Players.LocalPlayer
				if player then
					local tool = Instance.new("Tool")
					tool.Name = toolName
					local backpack = player:FindFirstChildOfClass("Backpack")
					if backpack then
						tool.Parent = backpack
					else
						tool.Parent = player
					end
					showChangeResult("tool created: " .. toolName)
					tweenOutAndDestroy(newToolUI, 0.5, function()
						activeUI = nil
						updateMainUIState()
					end)
				else
					showChangeResult("error creating tool")
					tweenOutAndDestroy(newToolUI, 0.5, function()
						activeUI = nil
						updateMainUIState()
					end)
				end
			end)
			activeUI = newToolUI
			updateMainUIState()
		end
		local function openHipheightUI()
			if activeUI then return end
			local hipUI = Instance.new("Frame")
			hipUI.Name = "hipUI"
			hipUI.Size = UDim2.new(0,300,0,80)
			hipUI.Position = UDim2.new(1,10,0.5,-40)
			hipUI.BackgroundColor3 = Color3.fromRGB(40,40,40)
			hipUI.Parent = mainFrame
			makeDraggable(hipUI)
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0,10)
			uiCorner.Parent = hipUI
			local closeHip = Instance.new("TextButton")
			closeHip.Size = UDim2.new(0,50,0,25)
			closeHip.Position = UDim2.new(1,-55,0,5)
			closeHip.Text = "close"
			closeHip.BackgroundColor3 = Color3.fromRGB(70,70,70)
			closeHip.TextColor3 = Color3.fromRGB(255,255,255)
			closeHip.Font = Enum.Font.SourceSans
			closeHip.TextScaled = true
			closeHip.Parent = hipUI
			closeHip.MouseButton1Click:Connect(function()
				tweenOutAndDestroy(hipUI, 0.5, function()
					activeUI = nil
					updateMainUIState()
				end)
			end)
			local hipBox = Instance.new("TextBox")
			hipBox.Size = UDim2.new(0,200,0,30)
			hipBox.Position = UDim2.new(0,10,0,40)
			hipBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
			hipBox.TextColor3 = Color3.fromRGB(255,255,255)
			hipBox.Font = Enum.Font.SourceSans
			hipBox.TextScaled = true
			hipBox.PlaceholderText = "hipheight value"
			hipBox.Parent = hipUI
			local applyHip = Instance.new("TextButton")
			applyHip.Size = UDim2.new(0,80,0,30)
			applyHip.Position = UDim2.new(0,220,0,40)
			applyHip.Text = "apply"
			applyHip.BackgroundColor3 = Color3.fromRGB(70,70,70)
			applyHip.TextColor3 = Color3.fromRGB(255,255,255)
			applyHip.Font = Enum.Font.SourceSans
			applyHip.TextScaled = true
			applyHip.Parent = hipUI
			applyHip.MouseButton1Click:Connect(function()
				local newHip = tonumber(hipBox.Text)
				local player = Players.LocalPlayer
				if player and player.Character then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					if humanoid then
						humanoid.HipHeight = newHip or humanoid.HipHeight
						showChangeResult("hipheight changed")
						tweenOutAndDestroy(hipUI, 0.5, function()
							activeUI = nil
							updateMainUIState()
						end)
					end
				end
			end)
			activeUI = hipUI
			updateMainUIState()
		end
		local function openTextChangerUI()
			if activeUI then return end
			local sideUI = Instance.new("Frame")
			sideUI.Name = "sideUI"
			sideUI.Size = UDim2.new(0,400,0,400)
			sideUI.Position = UDim2.new(1,10,0.5,-200)
			sideUI.BackgroundColor3 = Color3.fromRGB(30,30,30)
			sideUI.Parent = mainFrame
			makeDraggable(sideUI)
			local sideClose = Instance.new("TextButton")
			sideClose.Size = UDim2.new(0,50,0,25)
			sideClose.Position = UDim2.new(1,-55,0,5)
			sideClose.Text = "close"
			sideClose.BackgroundColor3 = Color3.fromRGB(50,50,50)
			sideClose.TextColor3 = Color3.fromRGB(255,255,255)
			sideClose.Font = Enum.Font.SourceSans
			sideClose.TextScaled = true
			sideClose.Parent = sideUI
			sideClose.MouseButton1Click:Connect(function()
				tweenOutAndDestroy(sideUI, 0.5, function()
					activeUI = nil
					updateMainUIState()
				end)
			end)
			local scrollingFrame = Instance.new("ScrollingFrame")
			scrollingFrame.Size = UDim2.new(1,0,1,-35)
			scrollingFrame.Position = UDim2.new(0,0,0,35)
			scrollingFrame.BackgroundTransparency = 1
			scrollingFrame.Parent = sideUI
			local listLayout = Instance.new("UIListLayout")
			listLayout.Parent = scrollingFrame
			listLayout.SortOrder = Enum.SortOrder.LayoutOrder
			wait(0.1)
			local groups = {}
			for _, obj in ipairs(Workspace:GetDescendants()) do
				if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("ProximityPrompt") then
					local key = string.lower(obj.Name)
					groups[key] = groups[key] or {}
					table.insert(groups[key], obj)
				end
			end
			for name, objs in pairs(groups) do
				local entry = Instance.new("Frame")
				entry.Size = UDim2.new(1,0,0,30)
				entry.BackgroundTransparency = 1
				entry.Parent = scrollingFrame
				local nameLabel = Instance.new("TextLabel")
				nameLabel.Size = UDim2.new(0.6,0,1,0)
				nameLabel.BackgroundTransparency = 1
				nameLabel.Text = name
				nameLabel.TextColor3 = Color3.fromRGB(200,200,200)
				nameLabel.Font = Enum.Font.SourceSans
				nameLabel.TextScaled = true
				nameLabel.Parent = entry
				local changeButton = Instance.new("TextButton")
				changeButton.Size = UDim2.new(0.4,0,1,0)
				changeButton.Position = UDim2.new(0.6,0,0,0)
				changeButton.Text = "change text"
				changeButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
				changeButton.TextColor3 = Color3.fromRGB(255,255,255)
				changeButton.Font = Enum.Font.SourceSans
				changeButton.TextScaled = true
				changeButton.Parent = entry
				changeButton.MouseButton1Click:Connect(function()
					local panel = Instance.new("Frame")
					panel.Size = UDim2.new(0,350,0,100)
					panel.Position = UDim2.new(1,10,0.5,-50)
					panel.BackgroundColor3 = Color3.fromRGB(40,40,40)
					panel.Parent = mainFrame
					makeDraggable(panel)
					local panelClose = Instance.new("TextButton")
					panelClose.Size = UDim2.new(0,50,0,25)
					panelClose.Position = UDim2.new(1,-55,0,5)
					panelClose.Text = "close"
					panelClose.BackgroundColor3 = Color3.fromRGB(70,70,70)
					panelClose.TextColor3 = Color3.fromRGB(255,255,255)
					panelClose.Font = Enum.Font.SourceSans
					panelClose.TextScaled = true
					panelClose.Parent = panel
					panelClose.MouseButton1Click:Connect(function()
						tweenOutAndDestroy(panel, 0.5)
					end)
					local textBox = Instance.new("TextBox")
					textBox.Size = UDim2.new(0,300,0,40)
					textBox.Position = UDim2.new(0,25,0,10)
					textBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
					textBox.TextColor3 = Color3.new(1,1,1)
					textBox.Font = Enum.Font.SourceSans
					textBox.TextScaled = true
					textBox.PlaceholderText = "enter new text"
					textBox.Parent = panel
					local applyButton = Instance.new("TextButton")
					applyButton.Size = UDim2.new(0,80,0,30)
					applyButton.Position = UDim2.new(0,280,0,60)
					applyButton.Text = "apply"
					applyButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
					applyButton.TextColor3 = Color3.fromRGB(255,255,255)
					applyButton.Font = Enum.Font.SourceSans
					applyButton.TextScaled = true
					applyButton.Parent = panel
					applyButton.MouseButton1Click:Connect(function()
						local newText = textBox.Text
						for _, obj in ipairs(objs) do
							if obj:IsA("TextLabel") or obj:IsA("TextButton") then
								obj.Text = newText
							elseif obj:IsA("ProximityPrompt") then
								obj.PromptText = newText
							end
						end
						showChangeResult("text changed")
						tweenOutAndDestroy(panel, 0.5)
					end)
				end)
			end
			activeUI = sideUI
			updateMainUIState()
		end
		local function openPlayerTeleportUI()
			if activeUI then return end
			local tpUI = Instance.new("Frame")
			tpUI.Name = "tpUI"
			tpUI.Size = UDim2.new(0,400,0,400)
			tpUI.Position = UDim2.new(1,10,0.5,-200)
			tpUI.BackgroundColor3 = Color3.fromRGB(30,30,30)
			tpUI.Parent = mainFrame
			makeDraggable(tpUI)
			local tpClose = Instance.new("TextButton")
			tpClose.Size = UDim2.new(0,50,0,25)
			tpClose.Position = UDim2.new(1,-55,0,5)
			tpClose.Text = "close"
			tpClose.BackgroundColor3 = Color3.fromRGB(50,50,50)
			tpClose.TextColor3 = Color3.fromRGB(255,255,255)
			tpClose.Font = Enum.Font.SourceSans
			tpClose.TextScaled = true
			tpClose.Parent = tpUI
			tpClose.MouseButton1Click:Connect(function()
				tweenOutAndDestroy(tpUI, 0.5, function()
					activeUI = nil
					updateMainUIState()
				end)
			end)
			local scrollingFrame = Instance.new("ScrollingFrame")
			scrollingFrame.Size = UDim2.new(1,0,1,-35)
			scrollingFrame.Position = UDim2.new(0,0,0,35)
			scrollingFrame.BackgroundTransparency = 1
			scrollingFrame.Parent = tpUI
			local listLayout = Instance.new("UIListLayout")
			listLayout.Parent = scrollingFrame
			listLayout.SortOrder = Enum.SortOrder.LayoutOrder
			for _, model in ipairs(Workspace:GetChildren()) do
				if model:IsA("Model") and model:FindFirstChildOfClass("Humanoid") then
					local entry = Instance.new("Frame")
					entry.Size = UDim2.new(1,0,0,30)
					entry.BackgroundTransparency = 1
					entry.Parent = scrollingFrame
					local nameLabel = Instance.new("TextLabel")
					nameLabel.Size = UDim2.new(0.7,0,1,0)
					nameLabel.BackgroundTransparency = 1
					nameLabel.Text = model.Name
					nameLabel.TextColor3 = Color3.fromRGB(200,200,200)
					nameLabel.Font = Enum.Font.SourceSans
					nameLabel.TextScaled = true
					nameLabel.Parent = entry
					local tpButton = Instance.new("TextButton")
					tpButton.Size = UDim2.new(0.3,0,1,0)
					tpButton.Position = UDim2.new(0.7,0,0,0)
					tpButton.Text = "tp to"
					tpButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
					tpButton.TextColor3 = Color3.fromRGB(255,255,255)
					tpButton.Font = Enum.Font.SourceSans
					tpButton.TextScaled = true
					tpButton.Parent = entry
					tpButton.MouseButton1Click:Connect(function()
						local originalColor = nameLabel.TextColor3
						nameLabel.TextColor3 = Color3.fromRGB(0,0,255)
						local player = Players.LocalPlayer
						if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
							local target = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart")
							if target then
								player.Character.HumanoidRootPart.CFrame = target.CFrame
								showChangeResult("teleported to " .. model.Name)
							else
								showChangeResult("target missing")
							end
						end
						delay(1, function() nameLabel.TextColor3 = originalColor end)
					end)
				end
			end
			activeUI = tpUI
			updateMainUIState()
		end
		newToolButton.MouseButton1Click:Connect(function() openNewToolUI() end)
		openTextButton.MouseButton1Click:Connect(function() openTextChangerUI() end)
		hipheightButton.MouseButton1Click:Connect(function() openHipheightUI() end)
		teleportButton.MouseButton1Click:Connect(function() openPlayerTeleportUI() end)
	end)
end)
print("Toolchanger script loaded.")
