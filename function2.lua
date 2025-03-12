local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "placeholderGui"
screenGui.Parent = CoreGui

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

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,400,0,200)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
makeDraggable(mainFrame)

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1,0,1,0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "loading..."
loadingText.TextColor3 = Color3.fromRGB(180,180,180)
loadingText.Font = Enum.Font.SourceSans
loadingText.TextScaled = true
loadingText.Parent = mainFrame

local fadeInTween = TweenService:Create(loadingText, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 0})
fadeInTween:Play()

delay(3, function()
	local fadeOutTween = TweenService:Create(loadingText, TweenInfo.new(1, Enum.EasingStyle.Linear), {TextTransparency = 1})
	fadeOutTween:Play()
	fadeOutTween.Completed:Connect(function()
		loadingText:Destroy()
		local placeholderButton = Instance.new("TextButton")
		placeholderButton.Size = UDim2.new(0,120,0,40)
		placeholderButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		placeholderButton.AnchorPoint = Vector2.new(0.5, 0.5)
		placeholderButton.Text = "adding buttons soon"
		placeholderButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
		placeholderButton.TextColor3 = Color3.fromRGB(255,255,255)
		placeholderButton.Font = Enum.Font.SourceSans
		placeholderButton.TextScaled = true
		placeholderButton.Parent = mainFrame
	end)
end)
