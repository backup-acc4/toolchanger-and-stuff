-- toolchanger revisited, by interactable
--[[
Features:
• Main UI (500×350) is centered.
• After a loading fade-out, a button container appears with 6 main buttons:
    - new tool
    - open ui text changer
    - hipheight changer
    - player teleport
    - f3x
    - invis
• When any pop-up is active, the main UI hides its buttons and displays a failsafe overlay.
• Each button creates its corresponding draggable pop-up to the right of the main UI.
    - New Tool: Opens a 300×80 UI to enter a tool name and create a tool.
    - Open UI Text Changer: Opens a 400×400 UI listing workspace UI objects (grouped by name) for text editing.
    - Hipheight Changer: Opens a 300×80 UI to change the player’s hipheight.
    - Player Teleport: Opens a 400×400 UI listing models (from Workspace:GetChildren()) with a Humanoid.
      Each entry shows the model’s name and a “tp to” button that teleports the player’s character.
    - f3x: Runs a script from an external URL.
    - invis: Runs a script that teleports your character’s parts far away and sets up a custom camera.
• All pop-ups are draggable.
• The close button on the main UI destroys the entire script; minimize shrinks the main UI.
• The change result message waits 2 seconds before fading out over 2 seconds.
--]]

---------------------------
-- SERVICES & GLOBAL VARIABLES
---------------------------
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "toolchangergui"
screenGui.Parent = CoreGui

-- Global variable to track the currently active pop-up UI.
local activeUI = nil

---------------------------
-- UTILITY FUNCTIONS
---------------------------
local function makeDraggable(frame)
	local dragging = false
	local dragStart, startPos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)
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
	-- Position below mainFrame:
	local pos = mainFrame.AbsolutePosition + Vector2.new(0, mainFrame.AbsoluteSize.Y + 10)
	label.Position = UDim2.new(0, pos.X, 0, pos.Y)
	-- Wait 2 seconds then fade out over 2 seconds:
	delay(2, function()
		local tween = TweenService:Create(label, TweenInfo.new(2, Enum.EasingStyle.Linear), {TextTransparency = 1, BackgroundTransparency = 1})
		tween:Play()
		tween.Completed:Connect(function() label:Destroy() end)
	end)
end

---------------------------
-- MAIN UI SETUP (CENTERED)
---------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,500,0,350)
-- Center the main UI on the screen using Offset positioning:
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
makeDraggable(mainFrame)

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0,10)
mainCorner.Parent = mainFrame

local expandedSize = UDim2.new(0,500,0,350)
local minimizedSize = UDim2.new(0,500,0,50)
local isMinimized = false

local expandTween = TweenService:Create(mainFrame, TweenInfo.new(1, Enum.EasingStyle.Quad), {Size = expandedSize})
expandTween:Play()

-- Loading Text
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

-- Close Button (destroys entire script)
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

-- Minimize Button (shrinks main UI and hides button container)
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

---------------------------
-- MAIN BUTTON CONTAINER & FAILSAFE OVERLAY
---------------------------
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

---------------------------
-- Invis Script Function
---------------------------
local function runInvisScript()
	-- Invis script code:
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()

	local mouse = player:GetMouse()

	-- Base position and movement variables.
	local basePos = Vector3.new(0, 0, 0)  -- Start at (0,0,0)
	local moveDirection = Vector3.new(0, 0, 0)
	local moveSpeed = 60  -- Movement speed set to 60.

	-- Input flags.
	local isSpaceDown = false
	local isNDown = false
	local isRightMouseDown = false
	local isMouseDown = false  -- Flag for left mouse button

	-- Set up the camera.
	local camera = workspace.CurrentCamera
	camera.CameraType = Enum.CameraType.Scriptable
	local cameraAngleX = math.rad(45)  -- Initial pitch.
	local cameraAngleY = math.rad(0)   -- Initial yaw.
	local cameraDistance = 20          -- Initial zoom distance.
	local cameraSensitivity = 0.3      -- Adjust drag sensitivity as needed.

	-- Function to continuously anchor and teleport all body parts.
	local function teleportCharacter()
		while true do
			for _, part in ipairs(character:GetChildren()) do
				if part:IsA("BasePart") then
					part.Anchored = true  -- Anchor the part
					part.Position = Vector3.new(0, 500, 1233333333333333)
				end
			end
			task.wait()
		end
	end

	-- UI Setup
	local function createUI()
		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = player:FindFirstChildOfClass("PlayerGui")

		local positionLabel = Instance.new("TextLabel")
		positionLabel.Size = UDim2.new(1, 0, 0, 30)
		positionLabel.Position = UDim2.new(0, 0, 1, -30)
		positionLabel.BackgroundTransparency = 0.5
		positionLabel.BackgroundColor3 = Color3.new(0, 0, 0)
		positionLabel.TextColor3 = Color3.new(1, 1, 1)
		positionLabel.TextScaled = true
		positionLabel.Parent = screenGui

		return positionLabel
	end

	local positionLabel = createUI()

	-- Left mouse button for setting movement target.
	mouse.Button1Down:Connect(function()
		isMouseDown = true
	end)
	mouse.Button1Up:Connect(function()
		isMouseDown = false
	end)

	-- Right mouse button for dragging camera and WASD for movement.
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			isRightMouseDown = true
		end
		if not gameProcessed then
			if input.KeyCode == Enum.KeyCode.W then
				moveDirection = moveDirection + Vector3.new(0, 0, -1)
			elseif input.KeyCode == Enum.KeyCode.S then
				moveDirection = moveDirection + Vector3.new(0, 0, 1)
			elseif input.KeyCode == Enum.KeyCode.A then
				moveDirection = moveDirection + Vector3.new(-1, 0, 0)
			elseif input.KeyCode == Enum.KeyCode.D then
				moveDirection = moveDirection + Vector3.new(1, 0, 0)
			elseif input.KeyCode == Enum.KeyCode.Space then
				isSpaceDown = true
			elseif input.KeyCode == Enum.KeyCode.N then
				isNDown = true
			end
		end
	end)

	UserInputService.InputEnded:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			isRightMouseDown = false
		end
		if input.KeyCode == Enum.KeyCode.W then
			moveDirection = moveDirection - Vector3.new(0, 0, -1)
		elseif input.KeyCode == Enum.KeyCode.S then
			moveDirection = moveDirection - Vector3.new(0, 0, 1)
		elseif input.KeyCode == Enum.KeyCode.A then
			moveDirection = moveDirection - Vector3.new(-1, 0, 0)
		elseif input.KeyCode == Enum.KeyCode.D then
			moveDirection = moveDirection - Vector3.new(1, 0, 0)
		elseif input.KeyCode == Enum.KeyCode.Space then
			isSpaceDown = false
		elseif input.KeyCode == Enum.KeyCode.N then
			isNDown = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseMovement and isRightMouseDown then
			local delta = input.Delta
			cameraAngleY = cameraAngleY - math.rad(delta.X * cameraSensitivity)
			cameraAngleX = math.clamp(cameraAngleX - math.rad(delta.Y * cameraSensitivity), math.rad(10), math.rad(80))
		elseif input.UserInputType == Enum.UserInputType.MouseWheel then
			cameraDistance = math.clamp(cameraDistance - input.Position.Z, 10, 100)
		end
	end)

	local function setupSphere()
		-- Create a sphere for the player.
		local sphere = Instance.new("Part")
		sphere.Name = "PlayerSphere"
		sphere.Transparency = 0.5
		sphere.CanCollide = true
		sphere.Anchored = true
		sphere.Shape = Enum.PartType.Ball
		sphere.Size = Vector3.new(2, 2, 2)
		sphere.Position = basePos
		sphere.Parent = workspace

		task.spawn(teleportCharacter)

		RunService.RenderStepped:Connect(function(delta)
			if isMouseDown and mouse.Target then
				basePos = mouse.Hit.p
			else
				basePos = basePos + (moveDirection * moveSpeed * delta)
			end
			if isSpaceDown then
				basePos = basePos + Vector3.new(0, moveSpeed * delta, 0)
			end
			if isNDown then
				basePos = basePos - Vector3.new(0, moveSpeed * delta, 0)
			end

			sphere.CFrame = CFrame.new(basePos)
			local offset = Vector3.new(
				cameraDistance * math.cos(cameraAngleX) * math.sin(cameraAngleY),
				cameraDistance * math.sin(cameraAngleX),
				cameraDistance * math.cos(cameraAngleX) * math.cos(cameraAngleY)
			)
			local cameraPosition = sphere.Position + offset
			camera.CFrame = CFrame.new(cameraPosition, sphere.Position)
			positionLabel.Text = string.format("Position: X=%.2f, Y=%.2f, Z=%.2f", basePos.X, basePos.Y, basePos.Z)
		end)
	end

	setupSphere()
end

---------------------------
-- AFTER LOADING, SHOW MAIN BUTTONS
---------------------------
delay(5, function()
	local fadeOutTween = TweenService:Create(loadingText, TweenInfo.new(1, Enum.EasingStyle.Linear), {TextTransparency = 1})
	fadeOutTween:Play()
	fadeOutTween.Completed:Connect(function()
		loadingText:Destroy()
		-- Create six main buttons in buttonContainer (positions calculated to evenly space them)
		-- Using fractions of the UI height: positions ~ 1/7, 2/7, …, 6/7.
		local newToolButton = Instance.new("TextButton")
		newToolButton.Name = "newToolButton"
		newToolButton.Size = UDim2.new(0,120,0,40)
		newToolButton.Position = UDim2.new(0.5,0,0.14,0)
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
		openTextButton.Position = UDim2.new(0.5,0,0.29,0)
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
		hipheightButton.Position = UDim2.new(0.5,0,0.43,0)
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
		teleportButton.Position = UDim2.new(0.5,0,0.57,0)
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
		f3xButton.Position = UDim2.new(0.5,0,0.71,0)
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
		invisButton.Position = UDim2.new(0.5,0,0.86,0)
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

		---------------------------
		-- Pop-up UI FUNCTIONS (created to the right of mainFrame)
		---------------------------
		local function openNewToolUI()
			if activeUI then return end
			local newToolUI = Instance.new("Frame")
			newToolUI.Name = "newToolUI"
			newToolUI.Size = UDim2.new(0,300,0,80)
			newToolUI.Position = UDim2.new(1,10,0.5,-40) -- to right of mainFrame
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
			-- Changed from screenGui to mainFrame
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
					-- Set parent to mainFrame so it's positioned relative to the UI
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
			-- Changed from screenGui to mainFrame
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

		---------------------------
		-- Connect Main Button Events
		---------------------------
		newToolButton.MouseButton1Click:Connect(function() openNewToolUI() end)
		openTextButton.MouseButton1Click:Connect(function() openTextChangerUI() end)
		hipheightButton.MouseButton1Click:Connect(function() openHipheightUI() end)
		teleportButton.MouseButton1Click:Connect(function() openPlayerTeleportUI() end)
	end)
end)

print("Toolchanger script loaded.")
