-- rebarded revisited!1!!
--yeahyeah this v3
--NOT FROM ULREAKILL
--*ultrakill
-- # my roblox user is McBlocker real!!!! #
--anyways take this early release v3
--bongbong
--mrman i dare you to not skid :imp-evil:

-- vee three
-- removed a bug
-- fixing ui bug
-- luaobfuscator.com
-- Forward declarations for frames used by page1 and extra UIs
local o, v, ae, au, aF, humanoidEditorFrame, codeFrame

local player = game:GetService("Players").LocalPlayer
local backpack = player:WaitForChild("Backpack")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ui thingy v1.5"
screenGui.Parent = game.CoreGui

-- Notify script loaded
game.StarterGui:SetCore("SendNotification", {
	Title = "script loaded";
	Text = "toolchanger v3 by interactable/kev";
	Duration = 3;
})

-- Main UI frame
local c = Instance.new("Frame")
c.Size = UDim2.new(0, 500, 0, 700)
c.Position = UDim2.new(0.5, -250, 0.15, 0)
c.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
c.Active = true
c.Draggable = true
c.Parent = screenGui

-- Top Bar (title and control buttons)
local d = Instance.new("TextLabel")
d.Size = UDim2.new(1, 0, 0, 50)
d.Position = UDim2.new(0, 0, 0, 0)
d.Text = "ui thingy v2"
d.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
d.TextScaled = true
d.Parent = c

local e = Instance.new("TextButton")
e.Size = UDim2.new(0, 80, 0, 40)
e.Position = UDim2.new(1, -90, 0, 5)
e.Text = "x"
e.TextScaled = true
e.Parent = c
e.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local g = Instance.new("TextButton")
g.Size = UDim2.new(0, 80, 0, 40)
g.Position = UDim2.new(1, -180, 0, 5)
g.Text = "_"
g.TextScaled = true
g.Parent = c
local isMinimized = false
g.MouseButton1Click:Connect(function()
	if not isMinimized then
		-- Hide everything except top bar (d, e, g)
		for _, h in ipairs(c:GetChildren()) do
			if h ~= d and h ~= e and h ~= g then
				h.Visible = false
			end
		end
		c.Size = UDim2.new(0, 500, 0, 40)
		isMinimized = true
	else
		-- Restore all children
		for _, h in ipairs(c:GetChildren()) do
			h.Visible = true
		end
		c.Size = UDim2.new(0, 500, 0, 700)
		isMinimized = false
	end
end)

-- Container for pages
local pageContainer = Instance.new("Frame")
pageContainer.Name = "pageContainer"
pageContainer.Size = UDim2.new(1, 0, 0.75, 0)
pageContainer.Position = UDim2.new(0, 0, 0.15, 0)
pageContainer.BackgroundTransparency = 1
pageContainer.Parent = c

-- Page 1 (original content)
local page1 = Instance.new("Frame")
page1.Name = "page1"
page1.Size = UDim2.new(1, 0, 1, 0)
page1.Position = UDim2.new(0, 0, 0, 0)
page1.BackgroundTransparency = 1
page1.Parent = pageContainer

-- Page 2 (new content)
local page2 = Instance.new("Frame")
page2.Name = "page2"
page2.Size = UDim2.new(1, 0, 1, 0)
page2.Position = UDim2.new(0, 0, 0, 0)
page2.BackgroundTransparency = 1
page2.Visible = false
page2.Parent = pageContainer

-- Button positioning values
local btnPositions = {0.25, 0.357, 0.464, 0.571, 0.679, 0.786, 0.893}
local btnHeight = 0.107

---------------------------
-- PAGE 1 BUTTONS
---------------------------
local j = Instance.new("TextButton")
j.Size = UDim2.new(0.8, 0, btnHeight, 0)
j.Position = UDim2.new(0.1, 0, btnPositions[1], 0)
j.Text = "hold ur tool out and we do it"
j.TextScaled = true
j.Parent = page1

local k = Instance.new("TextButton")
k.Size = UDim2.new(0.8, 0, btnHeight, 0)
k.Position = UDim2.new(0.1, 0, btnPositions[2], 0)
k.Text = "select ur tool and we do it"
k.TextScaled = true
k.Parent = page1

local l = Instance.new("TextButton")
l.Size = UDim2.new(0.8, 0, btnHeight, 0)
l.Position = UDim2.new(0.1, 0, btnPositions[3], 0)
l.Text = "gui changer (experimental)"
	l.TextScaled = true
l.Parent = page1

local m = Instance.new("TextButton")
m.Size = UDim2.new(0.8, 0, btnHeight, 0)
m.Position = UDim2.new(0.1, 0, btnPositions[4], 0)
m.Text = "teleport"
m.TextScaled = true
m.Parent = page1

local n = Instance.new("TextButton")
n.Size = UDim2.new(0.8, 0, btnHeight, 0)
n.Position = UDim2.new(0.1, 0, btnPositions[5], 0)
n.Text = "make new tool"
	n.TextScaled = true
n.Parent = page1

local btools = Instance.new("TextButton")
btools.Size = UDim2.new(0.8, 0, btnHeight, 0)
btools.Position = UDim2.new(0.1, 0, btnPositions[6], 0)
btools.Text = "btools"
	btools.TextScaled = true
btools.Parent = page1
btools.MouseButton1Click:Connect(function()
	-- Give building tools (HopperBins) and unlock all baseparts
	local hammer = Instance.new("HopperBin")
	hammer.Name = "hammer"
	hammer.BinType = 4
	hammer.Parent = backpack

	local cloneTool = Instance.new("HopperBin")
	cloneTool.Name = "clone"
	cloneTool.BinType = 3
	cloneTool.Parent = backpack

	local grabTool = Instance.new("HopperBin")
	grabTool.Name = "grab"
	grabTool.BinType = 2
	grabTool.Parent = backpack

	local function Traverse(inst)
		for _, v in pairs(inst:GetChildren()) do
			if v:IsA("BasePart") then
				v.Locked = false
			end
			if #v:GetChildren() > 0 then
				Traverse(v)
			end
		end
	end
	Traverse(game.Workspace)
	print("btools executed: building tools given and all baseparts unlocked")
end)

local heButton = Instance.new("TextButton")
heButton.Size = UDim2.new(0.8, 0, btnHeight, 0)
heButton.Position = UDim2.new(0.1, 0, btnPositions[7], 0)
heButton.Text = "humanoid editor"
	heButton.TextScaled = true
heButton.Parent = page1

---------------------------
-- PAGE 2 BUTTONS
---------------------------
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
flyButton.Position = UDim2.new(0.1, 0, 0.4, 0)
flyButton.Text = "fly"
	flyButton.TextScaled = true
flyButton.Parent = page2

local flyButtonClicked = false
flyButton.MouseButton1Click:Connect(function()
	if flyButtonClicked then return end
	flyButtonClicked = true
	spawn(function()
		repeat wait() until player and player.Character and player.Character:FindFirstChild("Torso") and player.Character:FindFirstChild("Humanoid")
		local mouse = player:GetMouse()
		repeat wait() until mouse

		local torso = player.Character.Torso
		local flying = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0
		local bg, bv

		local function Fly()
			game.StarterGui:SetCore("SendNotification", {
				Title = "fly activated";
				Text = "toolchanger v3 by interactable";
				Duration = 1;
			})
			bg = Instance.new("BodyGyro", torso)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.cframe = torso.CFrame
			bv = Instance.new("BodyVelocity", torso)
			bv.velocity = Vector3.new(0, 0.1, 0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			repeat wait()
				player.Character.Humanoid.PlatformStand = true
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed + 0.5 + (speed / maxspeed)
					if speed > maxspeed then
						speed = maxspeed
					end
				elseif speed ~= 0 then
					speed = speed - 1
					if speed < 0 then speed = 0 end
				end
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) -
						game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif speed ~= 0 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * 0.2, 0).p) -
						game.Workspace.CurrentCamera.CoordinateFrame.p)) * speed
				else
					bv.velocity = Vector3.new(0, 0.1, 0)
				end
				bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
					CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
			until not flying
			ctrl = {f = 0, b = 0, l = 0, r = 0}
			lastctrl = {f = 0, b = 0, l = 0, r = 0}
			speed = 0
			bg:Destroy() bg = nil
			bv:Destroy() bv = nil
			player.Character.Humanoid.PlatformStand = false
			game.StarterGui:SetCore("SendNotification", {
				Title = "fly deactivated";
				Text = "toolchanger v3 by interactable";
				Duration = 1;
			})
		end

		mouse.KeyDown:connect(function(key)
			if key:lower() == "e" then
				if flying then 
					flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = 1
			elseif key:lower() == "s" then
				ctrl.b = -1
			elseif key:lower() == "a" then
				ctrl.l = -1
			elseif key:lower() == "d" then
				ctrl.r = 1
			end
		end)
		mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			end
		end)
		Fly()
	end)
end)

-- Infinite Yield button
local infiniteYieldButton = Instance.new("TextButton")
infiniteYieldButton.Size = UDim2.new(0.8, 0, 0.2, 0)
infiniteYieldButton.Position = UDim2.new(0.1, 0, 0.65, 0)
infiniteYieldButton.Text = "infinite yield"
	infiniteYieldButton.TextScaled = true
infiniteYieldButton.Parent = page2
infiniteYieldButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/backup-acc4/toolchanger-main/refs/heads/main/infiniteyield-byedge.lua"))()
	print("infinite yield executed")
end)

-- Run Code button (opens codeFrame UI)
local runCodeButton = Instance.new("TextButton")
runCodeButton.Size = UDim2.new(0.8, 0, 0.2, 0)
runCodeButton.Position = UDim2.new(0.1, 0, 0.9, 0)
runCodeButton.Text = "run code"
	runCodeButton.TextScaled = true
runCodeButton.Parent = page2
runCodeButton.MouseButton1Click:Connect(function()
	codeFrame.Visible = true
	c.Visible = false
end)

---------------------------
-- Navigation buttons (for pages)
---------------------------
local navFrame = Instance.new("Frame")
navFrame.Name = "navFrame"
navFrame.Size = UDim2.new(1, 0, 0.1, 0)
navFrame.Position = UDim2.new(0, 0, 0.9, 0)
navFrame.BackgroundTransparency = 1
navFrame.Parent = c

local currentPage = 1
local leftButton = Instance.new("TextButton")
leftButton.Size = UDim2.new(0, 50, 0, 30)
leftButton.Position = UDim2.new(0, 10, 0.35, 0)
leftButton.Text = "<"
	leftButton.TextScaled = true
leftButton.Parent = navFrame

local rightButton = Instance.new("TextButton")
rightButton.Size = UDim2.new(0, 50, 0, 30)
rightButton.Position = UDim2.new(1, -60, 0.35, 0)
rightButton.Text = ">"
	rightButton.TextScaled = true
rightButton.Parent = navFrame

local function updatePages()
	if currentPage == 1 then
		page1.Visible = true
		page2.Visible = false
	else
		page1.Visible = false
		page2.Visible = true
	end
end

leftButton.MouseButton1Click:Connect(function()
	if currentPage > 1 then
		currentPage = currentPage - 1
		updatePages()
	end
end)
rightButton.MouseButton1Click:Connect(function()
	if currentPage < 2 then
		currentPage = currentPage + 1
		updatePages()
	end
end)

---------------------------
-- Humanoid Editor Frame
---------------------------
humanoidEditorFrame = Instance.new("Frame")
humanoidEditorFrame.Size = UDim2.new(0, 400, 0, 400)
humanoidEditorFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
humanoidEditorFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
humanoidEditorFrame.Active = true
humanoidEditorFrame.Draggable = true
humanoidEditorFrame.Visible = false
humanoidEditorFrame.Parent = screenGui

local heClose = e:Clone()
heClose.Parent = humanoidEditorFrame
heClose.Text = "x"
heClose.MouseButton1Click:Connect(function()
	humanoidEditorFrame.Visible = false
	c.Visible = true
end)

local humanoidProperties = {"WalkSpeed", "JumpPower", "HipHeight", "Health", "MaxHealth"}

local heScrollingFrame = Instance.new("ScrollingFrame")
heScrollingFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
heScrollingFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
heScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
heScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #humanoidProperties * 35)
heScrollingFrame.Parent = humanoidEditorFrame

local heElements = {}
for i, prop in ipairs(humanoidProperties) do
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.4, 0, 0, 30)
	label.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
	label.Text = string.lower(prop)
	label.BackgroundTransparency = 1
	label.Parent = heScrollingFrame

	local textbox = Instance.new("TextBox")
	textbox.Size = UDim2.new(0.5, 0, 0, 30)
	textbox.Position = UDim2.new(0.45, 0, 0, (i - 1) * 35)
	textbox.PlaceholderText = "value"
	textbox.Parent = heScrollingFrame

	heElements[prop] = textbox
end

local heApplyButton = Instance.new("TextButton")
heApplyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
heApplyButton.Position = UDim2.new(0.1, 0, 0.88, 0)
heApplyButton.Text = "apply changes"
heApplyButton.Parent = humanoidEditorFrame
heApplyButton.MouseButton1Click:Connect(function()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		for _, prop in ipairs(humanoidProperties) do
			local newVal = tonumber(heElements[prop].Text)
			if newVal then
				humanoid[prop] = newVal
				print(string.lower(prop) .. " set to " .. newVal)
			end
		end
	else
		print("humanoid not found")
	end
end)

local function refreshHumanoidEditor()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		for _, prop in ipairs(humanoidProperties) do
			local value = humanoid[prop]
			heElements[prop].Text = tostring(value)
		end
	end
end

---------------------------
-- Connect Page1 Buttons to Open Their Frames
---------------------------
j.MouseButton1Click:Connect(function()
	c.Visible = false
	o.Visible = true
end)
k.MouseButton1Click:Connect(function()
	c.Visible = false
	v.Visible = true
	updateToolList()
end)
l.MouseButton1Click:Connect(function()
	c.Visible = false
	ae.Visible = true
	updateGuiList()
end)
m.MouseButton1Click:Connect(function()
	c.Visible = false
	-- TELEPORT FRAME now uses player teleport: type in target player's username.
	au.Visible = true
end)
n.MouseButton1Click:Connect(function()
	c.Visible = false
	aF.Visible = true
end)
heButton.MouseButton1Click:Connect(function()
	refreshHumanoidEditor()
	humanoidEditorFrame.Visible = true
	c.Visible = false
end)

---------------------------
-- Additional Frames Definitions
---------------------------

-- Frame "o": hold ur tool out
o = Instance.new("Frame")
o.Size = UDim2.new(0, 400, 0, 300)
o.Position = UDim2.new(0.5, -200, 0.3, 0)
o.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
o.Active = true
o.Draggable = true
o.Visible = false
o.Parent = screenGui

local oClose = e:Clone()
oClose.Parent = o
oClose.Text = "x"
oClose.MouseButton1Click:Connect(function()
	o.Visible = false
	c.Visible = true
end)

local oTextBox = Instance.new("TextBox")
oTextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
oTextBox.Position = UDim2.new(0.1, 0, 0.35, 0)
oTextBox.PlaceholderText = "new name"
oTextBox.Parent = o

local oRename = Instance.new("TextButton")
oRename.Size = UDim2.new(0, 0.8, 0, 0.2)
oRename.Size = UDim2.new(0, 400 * 0.8, 0, 50) -- Adjusted for clarity
oRename.Position = UDim2.new(0.1, 0, 0.65, 0)
oRename.Text = "rename"
oRename.TextScaled = true
oRename.Parent = o
oRename.MouseButton1Click:Connect(function()
	local newName = oTextBox.Text
	if newName ~= "" then
		local char = player.Character
		if char then
			local tool = char:FindFirstChildOfClass("Tool")
			if tool then
				tool.Name = newName
				print("tool renamed to: " .. newName)
			else
				print("no tool equipped.")
			end
		end
	end
end)

-- Frame "v": select ur tool
v = Instance.new("Frame")
v.Size = UDim2.new(0, 400, 0, 500)
v.Position = UDim2.new(0.5, -200, 0.3, 0)
v.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
v.Active = true
v.Draggable = true
v.Visible = false
v.Parent = screenGui

local vClose = e:Clone()
vClose.Parent = v
vClose.Text = "x"
vClose.MouseButton1Click:Connect(function()
	v.Visible = false
	c.Visible = true
end)

local toolNameBox = Instance.new("TextBox")
toolNameBox.Size = UDim2.new(0.9, 0, 0.15, 0)
toolNameBox.Position = UDim2.new(0.05, 0, 0.58, 0)
toolNameBox.PlaceholderText = "enter new tool name"
toolNameBox.Parent = v

local vRenameButton = Instance.new("TextButton")
vRenameButton.Size = UDim2.new(0.9, 0, 0.15, 0)
vRenameButton.Position = UDim2.new(0.05, 0, 0.75, 0)
vRenameButton.Text = "rename tool"
	vRenameButton.TextScaled = true
vRenameButton.Parent = v

local toolScroll = Instance.new("ScrollingFrame")
toolScroll.Size = UDim2.new(0.9, 0, 0.4, 0)
toolScroll.Position = UDim2.new(0.05, 0, 0.15, 0)
toolScroll.CanvasSize = UDim2.new(0, 0, 0, 5 * 30)
toolScroll.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
toolScroll.Parent = v

local selectedTool
local function updateToolList()
	for _, child in pairs(toolScroll:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	local bp = player:FindFirstChild("Backpack")
	if bp then
		for _, tool in pairs(bp:GetChildren()) do
			if tool:IsA("Tool") then
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(1, 0, 0, 30)
				btn.Text = string.lower(tool.Name)
				btn.Parent = toolScroll
				btn.MouseButton1Click:Connect(function()
					selectedTool = tool
					print("selected tool: " .. tool.Name)
				end)
			end
		end
	end
end
vRenameButton.MouseButton1Click:Connect(function()
	local newName = toolNameBox.Text
	if newName ~= "" and selectedTool then
		selectedTool.Name = newName
		print("selected tool renamed to: " .. newName)
	else
		print("no tool selected or name empty.")
	end
end)

-- Frame "ae": gui changer (experimental)
ae = Instance.new("Frame")
ae.Size = UDim2.new(0, 400, 0, 500)
ae.Position = UDim2.new(0.5, -200, 0.3, 0)
ae.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ae.Active = true
ae.Draggable = true
ae.Visible = false
ae.Parent = screenGui

local aeClose = e:Clone()
aeClose.Parent = ae
aeClose.Text = "x"
aeClose.MouseButton1Click:Connect(function()
	ae.Visible = false
	c.Visible = true
end)

local guiScroll = Instance.new("ScrollingFrame")
guiScroll.Size = UDim2.new(0.9, 0, 0.4, 0)
guiScroll.Position = UDim2.new(0.05, 0, 0.15, 0)
guiScroll.CanvasSize = UDim2.new(0, 0, 0, 5 * 30)
	guiScroll.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
guiScroll.Parent = ae

local guiNameBox = Instance.new("TextBox")
guiNameBox.Size = UDim2.new(0.9, 0, 0.15, 0)
guiNameBox.Position = UDim2.new(0.05, 0, 0.58, 0)
guiNameBox.PlaceholderText = "enter new text"
guiNameBox.Parent = ae

local guiChangeButton = Instance.new("TextButton")
guiChangeButton.Size = UDim2.new(0.9, 0, 0.15, 0)
guiChangeButton.Position = UDim2.new(0.05, 0, 0.75, 0)
guiChangeButton.Text = "change text"
	guiChangeButton.TextScaled = true
guiChangeButton.Parent = ae

local selectedGui
local function updateGuiList()
	for _, child in pairs(guiScroll:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	local pg = player:FindFirstChildOfClass("PlayerGui")
	if pg then
		for _, gui in pairs(pg:GetChildren()) do
			if gui:IsA("ScreenGui") then
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(1, 0, 0, 30)
				btn.Text = string.lower(gui.Name)
				btn.Parent = guiScroll
				btn.MouseButton1Click:Connect(function()
					selectedGui = gui
					print("selected gui: " .. gui.Name)
				end)
			end
		end
	end
end
guiChangeButton.MouseButton1Click:Connect(function()
	local newText = guiNameBox.Text
	if newText ~= "" and selectedGui then
		local target
		for _, desc in ipairs(selectedGui:GetDescendants()) do
			if desc:IsA("TextLabel") then
				target = desc
				break
			end
		end
		if target then
			target.Text = string.lower(newText)
			print("textlabel in " .. selectedGui.Name .. " changed to: " .. string.lower(newText))
		else
			print("no textlabel found in selected gui.")
		end
	else
		print("no gui selected or text empty.")
	end
end)

-- Frame "au": teleport (now uses player teleport)
au = Instance.new("Frame")
au.Size = UDim2.new(0, 400, 0, 300)
au.Position = UDim2.new(0.5, -200, 0.3, 0)
au.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
au.Active = true
au.Draggable = true
au.Visible = false
au.Parent = screenGui

local auClose = e:Clone()
auClose.Parent = au
auClose.Text = "x"
auClose.MouseButton1Click:Connect(function()
	au.Visible = false
	c.Visible = true
end)

local teleportBox = Instance.new("TextBox")
teleportBox.Size = UDim2.new(0.8, 0, 0.2, 0)
teleportBox.Position = UDim2.new(0.1, 0, 0.35, 0)
teleportBox.PlaceholderText = "enter player username"
teleportBox.Parent = au

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0.8, 0, 0.2, 0)
teleportButton.Position = UDim2.new(0.1, 0, 0.65, 0)
teleportButton.Text = "teleport"
	teleportButton.TextScaled = true
teleportButton.Parent = au
teleportButton.MouseButton1Click:Connect(function()
	local targetName = teleportBox.Text
	if targetName ~= "" then
		local targetPlayer = game:GetService("Players"):FindFirstChild(targetName)
		if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local targetHRP = targetPlayer.Character.HumanoidRootPart
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				char:MoveTo(targetHRP.Position)
				print("teleported to " .. targetName)
			else
				print("local player's character not found")
			end
		else
			print("target player not found or not in-game")
		end
	else
		print("please enter a player username.")
	end
end)

-- Frame "aF": make new tool
aF = Instance.new("Frame")
aF.Size = UDim2.new(0, 400, 0, 350)
aF.Position = UDim2.new(0.5, -200, 0.3, 0)
aF.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
aF.Active = true
aF.Draggable = true
aF.Visible = false
aF.Parent = screenGui

local aFClose = e:Clone()
aFClose.Parent = aF
aFClose.Text = "x"
aFClose.MouseButton1Click:Connect(function()
	aF.Visible = false
	c.Visible = true
end)

local newToolBox = Instance.new("TextBox")
newToolBox.Size = UDim2.new(0, 400, 0, 50)
newToolBox.Position = UDim2.new(0.1, 0, 0.15, 0)
newToolBox.PlaceholderText = "new tool name"
newToolBox.Parent = aF

local advOptionsBtn = Instance.new("TextButton")
advOptionsBtn.Size = UDim2.new(0, 400, 0, 50)
advOptionsBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
advOptionsBtn.Text = "advanced options"
	advOptionsBtn.TextScaled = true
advOptionsBtn.Parent = aF

local toolOptionsFrame = Instance.new("ScrollingFrame")
toolOptionsFrame.Size = UDim2.new(0.9, 0, 0.5, 0)
toolOptionsFrame.Position = UDim2.new(0.05, 0, 0.5, 0)
toolOptionsFrame.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
toolOptionsFrame.Visible = false
toolOptionsFrame.Parent = aF

local optionHeight = 0.15
local optionY = 0
local tooltipBox = Instance.new("TextBox")
tooltipBox.Size = UDim2.new(1, 0, optionHeight, 0)
tooltipBox.Position = UDim2.new(0, 0, optionY, 0)
tooltipBox.PlaceholderText = "tooltip (optional)"
tooltipBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local reqHandleBox = Instance.new("TextBox")
reqHandleBox.Size = UDim2.new(1, 0, optionHeight, 0)
reqHandleBox.Position = UDim2.new(0, 0, optionY, 0)
reqHandleBox.PlaceholderText = "requireshandle (true/false)"
reqHandleBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local canDropBox = Instance.new("TextBox")
canDropBox.Size = UDim2.new(1, 0, optionHeight, 0)
canDropBox.Position = UDim2.new(0, 0, optionY, 0)
canDropBox.PlaceholderText = "canbedropped (true/false)"
canDropBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local gripBox = Instance.new("TextBox")
gripBox.Size = UDim2.new(1, 0, optionHeight, 0)
gripBox.Position = UDim2.new(0, 0, optionY, 0)
gripBox.PlaceholderText = "grip (x,y,z)"
gripBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local gripPosBox = Instance.new("TextBox")
gripPosBox.Size = UDim2.new(1, 0, optionHeight, 0)
gripPosBox.Position = UDim2.new(0, 0, optionY, 0)
gripPosBox.PlaceholderText = "grippos (x,y,z)"
gripPosBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local handleSizeBox = Instance.new("TextBox")
handleSizeBox.Size = UDim2.new(1, 0, optionHeight, 0)
handleSizeBox.Position = UDim2.new(0, 0, optionY, 0)
handleSizeBox.PlaceholderText = "handle size (x,y,z)"
handleSizeBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local handleColorBox = Instance.new("TextBox")
handleColorBox.Size = UDim2.new(1, 0, optionHeight, 0)
handleColorBox.Position = UDim2.new(0, 0, optionY, 0)
handleColorBox.PlaceholderText = "handle color (r,g,b)"
handleColorBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local handleMaterialBox = Instance.new("TextBox")
handleMaterialBox.Size = UDim2.new(1, 0, optionHeight, 0)
handleMaterialBox.Position = UDim2.new(0, 0, optionY, 0)
handleMaterialBox.PlaceholderText = "handle material (e.g., plastic)"
handleMaterialBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local handleTransBox = Instance.new("TextBox")
handleTransBox.Size = UDim2.new(1, 0, optionHeight, 0)
handleTransBox.Position = UDim2.new(0, 0, optionY, 0)
handleTransBox.PlaceholderText = "handle transparency (0-1)"
handleTransBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

local handleReflectBox = Instance.new("TextBox")
handleReflectBox.Size = UDim2.new(1, 0, optionHeight, 0)
handleReflectBox.Position = UDim2.new(0, 0, optionY, 0)
handleReflectBox.PlaceholderText = "handle reflectance (0-1)"
handleReflectBox.Parent = toolOptionsFrame
optionY = optionY + optionHeight

toolOptionsFrame.CanvasSize = UDim2.new(0, 0, 0, optionY)

local createToolButton = Instance.new("TextButton")
createToolButton.Size = UDim2.new(0.8, 0, 0.15, 0)
createToolButton.Position = UDim2.new(0.1, 0, 0.8, 0)
createToolButton.Text = "create tool"
	createToolButton.TextScaled = true
createToolButton.Parent = aF
createToolButton.MouseButton1Click:Connect(function()
	local newName = newToolBox.Text
	if newName ~= "" then
		local bp = player:FindFirstChild("Backpack")
		if not bp then
			bp = Instance.new("Folder")
			bp.Name = "Backpack"
			bp.Parent = player
		end
		local tool = Instance.new("Tool")
		tool.Name = newName
		local handle = Instance.new("Part")
		handle.Name = "Handle"
		local size = Vector3.new(1,1,1)
		local color = Color3.new(1,1,1)
		local material = Enum.Material.Plastic
		local trans = 0
		local reflect = 0
		local grip, gripPos
		if toolOptionsFrame.Visible then
			tool.ToolTip = tooltipBox.Text or ""
			tool.RequiresHandle = (string.lower(reqHandleBox.Text) == "true")
			tool.CanBeDropped = (string.lower(canDropBox.Text) == "true")
			if gripBox.Text ~= "" then
				local parts = string.split(gripBox.Text, ",")
				if #parts == 3 then
					local gx = tonumber(parts[1])
					local gy = tonumber(parts[2])
					local gz = tonumber(parts[3])
					if gx and gy and gz then
						grip = Vector3.new(gx, gy, gz)
					end
				end
			end
			if gripPosBox.Text ~= "" then
				local parts = string.split(gripPosBox.Text, ",")
				if #parts == 3 then
					local gx = tonumber(parts[1])
					local gy = tonumber(parts[2])
					local gz = tonumber(parts[3])
					if gx and gy and gz then
						gripPos = Vector3.new(gx, gy, gz)
					end
				end
			end
			if handleSizeBox.Text ~= "" then
				local parts = string.split(handleSizeBox.Text, ",")
				if #parts == 3 then
					local sx = tonumber(parts[1])
					local sy = tonumber(parts[2])
					local sz = tonumber(parts[3])
					if sx and sy and sz then
						size = Vector3.new(sx, sy, sz)
					end
				end
			end
			if handleColorBox.Text ~= "" then
				local parts = string.split(handleColorBox.Text, ",")
				if #parts == 3 then
					local r = tonumber(parts[1])
					local g = tonumber(parts[2])
					local b = tonumber(parts[3])
					if r and g and b then
						color = Color3.new(r, g, b)
					end
				end
			end
			if handleMaterialBox.Text ~= "" then
				local success, mat = pcall(function() return Enum.Material[handleMaterialBox.Text] end)
				if success and mat then
					material = mat
				end
			end
			if handleTransBox.Text ~= "" then
				local t = tonumber(handleTransBox.Text)
				if t then
					trans = t
				end
			end
			if handleReflectBox.Text ~= "" then
				local refl = tonumber(handleReflectBox.Text)
				if refl then
					reflect = refl
				end
			end
		end
		tool.ToolTip = tool.ToolTip or ""
		tool.RequiresHandle = tool.RequiresHandle or true
		tool.CanBeDropped = tool.CanBeDropped or true
		if grip then tool.Grip = grip end
		if gripPos then tool.GripPos = gripPos end
		handle.Size = size
		handle.Color = color
		handle.Material = material
		handle.Transparency = trans
		handle.Reflectance = reflect
		handle.Parent = tool
		tool.Parent = bp
		print("new tool created: " .. newName)
	else
		print("please enter a valid tool name.")
	end
end)

---------------------------
-- NEW: Code Execution UI
---------------------------
codeFrame = Instance.new("Frame")
codeFrame.Size = UDim2.new(0, 400, 0, 300)
codeFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
codeFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
codeFrame.Active = true
codeFrame.Draggable = true
codeFrame.Visible = false
codeFrame.Parent = screenGui

local codeClose = e:Clone()
codeClose.Parent = codeFrame
codeClose.Text = "x"
codeClose.MouseButton1Click:Connect(function()
	codeFrame.Visible = false
	c.Visible = true
end)

local codeTextBox = Instance.new("TextBox")
codeTextBox.Size = UDim2.new(0.9, 0, 0.6, 0)
codeTextBox.Position = UDim2.new(0.05, 0, 0.2, 0)
codeTextBox.PlaceholderText = "enter lua code here..."
codeTextBox.MultiLine = true
codeTextBox.ClearTextOnFocus = false
codeTextBox.Text = ""
codeTextBox.Parent = codeFrame

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0.8, 0, 0.15, 0)
executeButton.Position = UDim2.new(0.1, 0, 0.85, 0)
executeButton.Text = "execute"
	executeButton.TextScaled = true
executeButton.Parent = codeFrame
executeButton.MouseButton1Click:Connect(function()
	local code = codeTextBox.Text
	local func, err = loadstring(code)
	if func then
		pcall(func)
		print("code executed successfully")
	else
		print("error executing code: " .. err)
	end
end)

---------------------------
-- Navigation Buttons for Pages
---------------------------
local navFrame = Instance.new("Frame")
navFrame.Name = "navFrame"
navFrame.Size = UDim2.new(1, 0, 0.1, 0)
navFrame.Position = UDim2.new(0, 0, 0.9, 0)
navFrame.BackgroundTransparency = 1
navFrame.Parent = c

local currentPage = 1
local leftButton = Instance.new("TextButton")
leftButton.Size = UDim2.new(0, 50, 0, 30)
leftButton.Position = UDim2.new(0, 10, 0.35, 0)
leftButton.Text = "<"
	leftButton.TextScaled = true
leftButton.Parent = navFrame

local rightButton = Instance.new("TextButton")
rightButton.Size = UDim2.new(0, 50, 0, 30)
rightButton.Position = UDim2.new(1, -60, 0.35, 0)
rightButton.Text = ">"
	rightButton.TextScaled = true
rightButton.Parent = navFrame

local function updatePages()
	if currentPage == 1 then
		page1.Visible = true
		page2.Visible = false
	else
		page1.Visible = false
		page2.Visible = true
	end
end

leftButton.MouseButton1Click:Connect(function()
	if currentPage > 1 then
		currentPage = currentPage - 1
		updatePages()
	end
end)
rightButton.MouseButton1Click:Connect(function()
	if currentPage < 2 then
		currentPage = currentPage + 1
		updatePages()
	end
end)

---------------------------
-- Humanoid Editor Frame
---------------------------
humanoidEditorFrame = Instance.new("Frame")
humanoidEditorFrame.Size = UDim2.new(0, 400, 0, 400)
humanoidEditorFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
humanoidEditorFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
humanoidEditorFrame.Active = true
humanoidEditorFrame.Draggable = true
humanoidEditorFrame.Visible = false
humanoidEditorFrame.Parent = screenGui

local heClose = e:Clone()
heClose.Parent = humanoidEditorFrame
heClose.Text = "x"
heClose.MouseButton1Click:Connect(function()
	humanoidEditorFrame.Visible = false
	c.Visible = true
end)

local humanoidProperties = {"WalkSpeed", "JumpPower", "HipHeight", "Health", "MaxHealth"}

local heScrollingFrame = Instance.new("ScrollingFrame")
heScrollingFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
heScrollingFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
heScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
heScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #humanoidProperties * 35)
heScrollingFrame.Parent = humanoidEditorFrame

local heElements = {}
for i, prop in ipairs(humanoidProperties) do
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.4, 0, 0, 30)
	label.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
	label.Text = string.lower(prop)
	label.BackgroundTransparency = 1
	label.Parent = heScrollingFrame

	local textbox = Instance.new("TextBox")
	textbox.Size = UDim2.new(0.5, 0, 0, 30)
	textbox.Position = UDim2.new(0.45, 0, 0, (i - 1) * 35)
	textbox.PlaceholderText = "value"
	textbox.Parent = heScrollingFrame

	heElements[prop] = textbox
end

local heApplyButton = Instance.new("TextButton")
heApplyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
heApplyButton.Position = UDim2.new(0.1, 0, 0.88, 0)
heApplyButton.Text = "apply changes"
heApplyButton.Parent = humanoidEditorFrame
heApplyButton.MouseButton1Click:Connect(function()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		for _, prop in ipairs(humanoidProperties) do
			local newVal = tonumber(heElements[prop].Text)
			if newVal then
				humanoid[prop] = newVal
				print(string.lower(prop) .. " set to " .. newVal)
			end
		end
	else
		print("humanoid not found")
	end
end)

local function refreshHumanoidEditor()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		for _, prop in ipairs(humanoidProperties) do
			local value = humanoid[prop]
			heElements[prop].Text = tostring(value)
		end
	end
end

---------------------------
-- Connect Page1 Buttons to Open Their Frames
---------------------------
j.MouseButton1Click:Connect(function()
	c.Visible = false
	o.Visible = true
end)
k.MouseButton1Click:Connect(function()
	c.Visible = false
	v.Visible = true
	updateToolList()
end)
l.MouseButton1Click:Connect(function()
	c.Visible = false
	ae.Visible = true
	updateGuiList()
end)
m.MouseButton1Click:Connect(function()
	c.Visible = false
	au.Visible = true
end)
n.MouseButton1Click:Connect(function()
	c.Visible = false
	aF.Visible = true
end)
heButton.MouseButton1Click:Connect(function()
	refreshHumanoidEditor()
	humanoidEditorFrame.Visible = true
	c.Visible = false
end)

---------------------------
-- NEW: Code Execution UI (for "run code" button)
---------------------------
codeFrame = Instance.new("Frame")
codeFrame.Size = UDim2.new(0, 400, 0, 300)
codeFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
codeFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
codeFrame.Active = true
codeFrame.Draggable = true
codeFrame.Visible = false
codeFrame.Parent = screenGui

local codeClose = e:Clone()
codeClose.Parent = codeFrame
codeClose.Text = "x"
codeClose.MouseButton1Click:Connect(function()
	codeFrame.Visible = false
	c.Visible = true
end)

local codeTextBox = Instance.new("TextBox")
codeTextBox.Size = UDim2.new(0.9, 0, 0.6, 0)
codeTextBox.Position = UDim2.new(0.05, 0, 0.2, 0)
codeTextBox.PlaceholderText = "enter lua code here..."
codeTextBox.MultiLine = true
codeTextBox.ClearTextOnFocus = false
codeTextBox.Text = ""
codeTextBox.Parent = codeFrame

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0.8, 0, 0.15, 0)
executeButton.Position = UDim2.new(0.1, 0, 0.85, 0)
executeButton.Text = "execute"
	executeButton.TextScaled = true
executeButton.Parent = codeFrame
executeButton.MouseButton1Click:Connect(function()
	local code = codeTextBox.Text
	local func, err = loadstring(code)
	if func then
		pcall(func)
		print("code executed successfully")
	else
		print("error executing code: " .. err)
	end
end)

-- end of code
