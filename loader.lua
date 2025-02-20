-- rebarded revisited!1!!
--yeahyeah this v2
--NOT FROM ULREAKILL
--*ultrakill
--anyways take this early release v2
--bongbong
--mrman i dare you to not skid :imp-evil:
local a = game:GetService("Players").LocalPlayer
local b = Instance.new("ScreenGui")
b.Name = "ui thingy v1.5"
b.Parent = game.CoreGui

-- main ui frame enlarged to 600px tall
local c = Instance.new("Frame")
c.Size = UDim2.new(0, 400, 0, 600)
c.Position = UDim2.new(0.5, -200, 0.3, 0)
c.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
c.Active = true
c.Draggable = true
c.Parent = b

local d = Instance.new("TextLabel")
d.Size = UDim2.new(1, 0, 0.15, 0)
d.Position = UDim2.new(0, 0, 0, 0)
d.Text = "ui thingy v2"
d.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
d.Parent = c

local e = Instance.new("TextButton")
e.Size = UDim2.new(0.2, 0, 0.1, 0)
e.Position = UDim2.new(0.8, 0, 0, 0)
e.Text = "x"
e.TextScaled = true
e.Parent = c
e.MouseButton1Click:Connect(function()
    b:Destroy()
end)

local f = false
local g = Instance.new("TextButton")
g.Size = UDim2.new(0.2, 0, 0.1, 0)
g.Position = UDim2.new(0.6, 0, 0, 0)
g.Text = "_"
g.TextScaled = true
g.Parent = c
g.MouseButton1Click:Connect(function()
    if not f then
        for _, h in ipairs(c:GetChildren()) do
            if h ~= d and h ~= e and h ~= g then
                h.Visible = false
            end
        end
        c.Size = UDim2.new(0, 400, 0, 40)
        f = true
    else
        for _, h in ipairs(c:GetChildren()) do
            if h ~= d and h ~= e and h ~= g then
                h.Visible = true
            end
        end
        c.Size = UDim2.new(0, 400, 0, 600)
        f = false
    end
end)

local i = Instance.new("TextLabel")
i.Size = UDim2.new(0, 320, 0, 60)
i.Position = UDim2.new(0.1, 0, 0.15, 0)
i.Text = "select algorithm:"
i.BackgroundTransparency = 1
i.Parent = c

-- for 7 buttons, evenly space them from scale 0.25 to 1.0
local btnPositions = {0.25, 0.357, 0.464, 0.571, 0.679, 0.786, 0.893}
local btnHeight = 0.107

local j = Instance.new("TextButton")
j.Size = UDim2.new(0.8, 0, btnHeight, 0)
j.Position = UDim2.new(0.1, 0, btnPositions[1], 0)
j.Text = "hold ur tool out and we do it"
j.Parent = c

local k = Instance.new("TextButton")
k.Size = UDim2.new(0.8, 0, btnHeight, 0)
k.Position = UDim2.new(0.1, 0, btnPositions[2], 0)
k.Text = "select ur tool and we do it"
k.Parent = c

local l = Instance.new("TextButton")
l.Size = UDim2.new(0.8, 0, btnHeight, 0)
l.Position = UDim2.new(0.1, 0, btnPositions[3], 0)
l.Text = "gui changer (experimental)"
l.Parent = c

local m = Instance.new("TextButton")
m.Size = UDim2.new(0.8, 0, btnHeight, 0)
m.Position = UDim2.new(0.1, 0, btnPositions[4], 0)
m.Text = "teleport"
m.Parent = c

local n = Instance.new("TextButton")
n.Size = UDim2.new(0.8, 0, btnHeight, 0)
n.Position = UDim2.new(0.1, 0, btnPositions[5], 0)
n.Text = "make new tool"
n.Parent = c

local f3x = Instance.new("TextButton")
f3x.Size = UDim2.new(0.8, 0, btnHeight, 0)
f3x.Position = UDim2.new(0.1, 0, btnPositions[6], 0)
f3x.Text = "f3x"
f3x.Parent = c
f3x.MouseButton1Click:Connect(function()
    local backpack = a:WaitForChild("Backpack")
    
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

    print("hopperbins added: hammer, clone, grab")
end)

-- new "humanoid editor" button replaces the previous walkspeed button
local heButton = Instance.new("TextButton")
heButton.Size = UDim2.new(0.8, 0, btnHeight, 0)
heButton.Position = UDim2.new(0.1, 0, btnPositions[7], 0)
heButton.Text = "humanoid editor"
heButton.Parent = c

--------------------------------------------------
-- humanoid editor frame
--------------------------------------------------
local humanoidEditorFrame = Instance.new("Frame")
humanoidEditorFrame.Size = UDim2.new(0, 400, 0, 400)
humanoidEditorFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
humanoidEditorFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
humanoidEditorFrame.Active = true
humanoidEditorFrame.Draggable = true
humanoidEditorFrame.Visible = false
humanoidEditorFrame.Parent = b

local heClose = e:Clone()
heClose.Parent = humanoidEditorFrame
heClose.Text = "x"
heClose.MouseButton1Click:Connect(function()
    humanoidEditorFrame.Visible = false
    c.Visible = true
end)

-- list of humanoid properties to edit (property names must remain unchanged for the api)
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
    label.Position = UDim2.new(0, 0, 0, (i-1) * 35)
    label.Text = string.lower(prop)
    label.BackgroundTransparency = 1
    label.Parent = heScrollingFrame

    local textbox = Instance.new("TextBox")
    textbox.Size = UDim2.new(0.5, 0, 0, 30)
    textbox.Position = UDim2.new(0.45, 0, 0, (i-1) * 35)
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
    local character = a.Character or a.CharacterAdded:Wait()
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

-- function to refresh the humanoid editor with current values
local function refreshHumanoidEditor()
    local character = a.Character or a.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        for _, prop in ipairs(humanoidProperties) do
            local value = humanoid[prop]
            heElements[prop].Text = tostring(value)
        end
    end
end

-- open the humanoid editor when the button is clicked
heButton.MouseButton1Click:Connect(function()
    refreshHumanoidEditor()
    humanoidEditorFrame.Visible = true
    c.Visible = false
end)

--------------------------------------------------
-- the rest of the ui frames remain unchanged below
--------------------------------------------------

local o = Instance.new("Frame")
o.Size = UDim2.new(0, 400, 0, 300)
o.Position = UDim2.new(0.5, -200, 0.3, 0)
o.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
o.Active = true
o.Draggable = true
o.Visible = false
o.Parent = b

local p = e:Clone()
p.Parent = o
p.Text = "x"
p.MouseButton1Click:Connect(function()
    o.Visible = false
    c.Visible = true
end)

local q = Instance.new("TextBox")
q.Size = UDim2.new(0.8, 0, 0.2, 0)
q.Position = UDim2.new(0.1, 0, 0.35, 0)
q.PlaceholderText = "new name"
q.Parent = o

local r = Instance.new("TextButton")
r.Size = UDim2.new(0.8, 0, 0.2, 0)
r.Position = UDim2.new(0.1, 0, 0.65, 0)
r.Text = "rename"
r.Parent = o
r.MouseButton1Click:Connect(function()
    local s1 = q.Text
    if s1 ~= "" then
        local t1 = a.Character
        if t1 then
            local u1 = t1:FindFirstChildOfClass("Tool")
            if u1 then
                u1.Name = s1
                print("tool renamed to: " .. s1)
            else
                print("no tool equipped.")
            end
        end
    end
end)

local v = Instance.new("Frame")
v.Size = UDim2.new(0, 400, 0, 500)
v.Position = UDim2.new(0.5, -200, 0.3, 0)
v.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
v.Active = true
v.Draggable = true
v.Visible = false
v.Parent = b

local w = e:Clone()
w.Parent = v
w.Text = "x"
w.MouseButton1Click:Connect(function()
    v.Visible = false
    c.Visible = true
end)

local x = Instance.new("ScrollingFrame")
x.Size = UDim2.new(0.9, 0, 0.4, 0)
x.Position = UDim2.new(0.05, 0, 0.15, 0)
x.CanvasSize = UDim2.new(0, 0, 5, 0)
x.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
x.Parent = v
x.ChildAdded:Connect(function()
    local z = 0
    for _, y in pairs(x:GetChildren()) do
        if y:IsA("TextButton") then
            z = z + 1
        end
    end
    x.CanvasSize = UDim2.new(0, 0, 0, z * 30)
end)

local aa = Instance.new("TextBox")
aa.Size = UDim2.new(0.9, 0, 0.15, 0)
aa.Position = UDim2.new(0.05, 0, 0.58, 0)
aa.PlaceholderText = "enter new tool name"
aa.Parent = v

local ab = Instance.new("TextButton")
ab.Size = UDim2.new(0.9, 0, 0.15, 0)
ab.Position = UDim2.new(0.05, 0, 0.75, 0)
ab.Text = "rename tool"
ab.Parent = v

local ac = nil
local function ad()
    for _, ae in pairs(x:GetChildren()) do
        if ae:IsA("TextButton") then
            ae:Destroy()
        end
    end
    local ah = a:FindFirstChild("Backpack")
    if ah then
        for _, af in pairs(ah:GetChildren()) do
            if af:IsA("Tool") then
                local ag = Instance.new("TextButton")
                ag.Size = UDim2.new(1, 0, 0, 30)
                ag.Text = string.lower(af.Name)
                ag.Parent = x
                ag.MouseButton1Click:Connect(function()
                    ac = af
                    print("selected tool: " .. af.Name)
                end)
            end
        end
    end
end
ab.MouseButton1Click:Connect(function()
    local af1 = aa.Text
    if af1 ~= "" and ac then
        ac.Name = af1
        print("selected tool renamed to: " .. af1)
    else
        print("no tool selected or name empty.")
    end
end)

local ae = Instance.new("Frame")
ae.Size = UDim2.new(0, 400, 0, 500)
ae.Position = UDim2.new(0.5, -200, 0.3, 0)
ae.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ae.Active = true
ae.Draggable = true
ae.Visible = false
ae.Parent = b

local af = e:Clone()
af.Parent = ae
af.Text = "x"
af.MouseButton1Click:Connect(function()
    ae.Visible = false
    c.Visible = true
end)

local ag = Instance.new("ScrollingFrame")
ag.Size = UDim2.new(0.9, 0, 0.4, 0)
ag.Position = UDim2.new(0.05, 0, 0.15, 0)
ag.CanvasSize = UDim2.new(0, 0, 5, 0)
ag.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ag.Parent = ae
ag.ChildAdded:Connect(function()
    local ah1 = 0
    for _, ai in pairs(ag:GetChildren()) do
        if ai:IsA("TextButton") then
            ah1 = ah1 + 1
        end
    end
    ag.CanvasSize = UDim2.new(0, 0, 0, ah1 * 30)
end)

local aj = Instance.new("TextBox")
aj.Size = UDim2.new(0.9, 0, 0.15, 0)
aj.Position = UDim2.new(0.05, 0, 0.58, 0)
aj.PlaceholderText = "enter new text"
aj.Parent = ae

local ak = Instance.new("TextButton")
ak.Size = UDim2.new(0.9, 0, 0.15, 0)
ak.Position = UDim2.new(0.05, 0, 0.75, 0)
ak.Text = "change text"
ak.Parent = ae

local al = nil
local function am()
    for _, an in pairs(ag:GetChildren()) do
        if an:IsA("TextButton") then
            an:Destroy()
        end
    end
    local ao = a:FindFirstChildOfClass("PlayerGui")
    if ao then
        for _, ap in pairs(ao:GetChildren()) do
            if ap:IsA("ScreenGui") then
                local aq = Instance.new("TextButton")
                aq.Size = UDim2.new(1, 0, 0, 30)
                aq.Text = string.lower(ap.Name)
                aq.Parent = ag
                aq.MouseButton1Click:Connect(function()
                    al = ap
                    print("selected gui: " .. ap.Name)
                end)
            end
        end
    end
end
ak.MouseButton1Click:Connect(function()
    local ar = aj.Text
    if ar ~= "" and al then
        local as = nil
        for _, at in ipairs(al:GetDescendants()) do
            if at:IsA("TextLabel") then
                as = at
                break
            end
        end
        if as then
            as.Text = string.lower(ar)
            print("textlabel in " .. al.Name .. " changed to: " .. string.lower(ar))
        else
            print("no textlabel found in selected gui.")
        end
    else
        print("no gui selected or text empty.")
    end
end)

local au = Instance.new("Frame")
au.Size = UDim2.new(0, 400, 0, 300)
au.Position = UDim2.new(0.5, -200, 0.3, 0)
au.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
au.Active = true
au.Draggable = true
au.Visible = false
au.Parent = b

local av = e:Clone()
av.Parent = au
av.Text = "x"
av.MouseButton1Click:Connect(function()
    au.Visible = false
    c.Visible = true
end)

local aw = Instance.new("TextBox")
aw.Size = UDim2.new(0.8, 0, 0.2, 0)
aw.Position = UDim2.new(0.1, 0, 0.35, 0)
aw.PlaceholderText = "enter teleport vector3 (x,y,z)"
aw.Parent = au

local ax = Instance.new("TextButton")
ax.Size = UDim2.new(0.8, 0, 0.2, 0)
ax.Position = UDim2.new(0.1, 0, 0.65, 0)
ax.Text = "teleport"
ax.Parent = au
ax.MouseButton1Click:Connect(function()
    local ay = aw.Text
    if ay ~= "" then
        local az = string.split(ay, ",")
        if #az == 3 then
            local aA = tonumber(az[1])
            local aB = tonumber(az[2])
            local aC = tonumber(az[3])
            if aA and aB and aC then
                local aD = a.Character
                if aD and aD:FindFirstChild("humanoidrootpart") then
                    aD:MoveTo(Vector3.new(aA, aB, aC))
                    print("teleported to: " .. string.lower(ay))
                else
                    print("character or humanoidrootpart not found")
                end
            else
                print("invalid vector3 input.")
            end
        else
            print("enter a valid vector3 in the format x,y,z")
        end
    else
        print("please enter a teleport location.")
    end
end)

local aF = Instance.new("Frame")
aF.Size = UDim2.new(0, 400, 0, 350)
aF.Position = UDim2.new(0.5, -200, 0.3, 0)
aF.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
aF.Active = true
aF.Draggable = true
aF.Visible = false
aF.Parent = b

local aG = e:Clone()
aG.Parent = aF
aG.Text = "x"
aG.MouseButton1Click:Connect(function()
    aF.Visible = false
    c.Visible = true
end)

local aH = Instance.new("TextBox")
aH.Size = UDim2.new(0.8, 0, 0.15, 0)
aH.Position = UDim2.new(0.1, 0, 0.15, 0)
aH.PlaceholderText = "new tool name"
aH.Parent = aF

local aI = Instance.new("TextButton")
aI.Size = UDim2.new(0.8, 0, 0.15, 0)
aI.Position = UDim2.new(0.1, 0, 0.35, 0)
aI.Text = "advanced options"
aI.Parent = aF

local aJ = Instance.new("ScrollingFrame")
aJ.Size = UDim2.new(0.9, 0, 0.5, 0)
aJ.Position = UDim2.new(0.05, 0, 0.5, 0)
aJ.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
aJ.Visible = false
aJ.Parent = aF

local aK = 0.15
local aL = 0
local aM = Instance.new("TextBox")
aM.Size = UDim2.new(1, 0, aK, 0)
aM.Position = UDim2.new(0, 0, aL, 0)
aM.PlaceholderText = "tooltip (optional)"
aM.Parent = aJ
aL = aL + aK

local aN = Instance.new("TextBox")
aN.Size = UDim2.new(1, 0, aK, 0)
aN.Position = UDim2.new(0, 0, aL, 0)
aN.PlaceholderText = "requireshandle (true/false)"
aN.Parent = aJ
aL = aL + aK

local aO = Instance.new("TextBox")
aO.Size = UDim2.new(1, 0, aK, 0)
aO.Position = UDim2.new(0, 0, aL, 0)
aO.PlaceholderText = "canbedropped (true/false)"
aO.Parent = aJ
aL = aL + aK

local aP = Instance.new("TextBox")
aP.Size = UDim2.new(1, 0, aK, 0)
aP.Position = UDim2.new(0, 0, aL, 0)
aP.PlaceholderText = "grip (x,y,z)"
aP.Parent = aJ
aL = aL + aK

local aQ = Instance.new("TextBox")
aQ.Size = UDim2.new(1, 0, aK, 0)
aQ.Position = UDim2.new(0, 0, aL, 0)
aQ.PlaceholderText = "grippos (x,y,z)"
aQ.Parent = aJ
aL = aL + aK

local aR = Instance.new("TextBox")
aR.Size = UDim2.new(1, 0, aK, 0)
aR.Position = UDim2.new(0, 0, aL, 0)
aR.PlaceholderText = "handle size (x,y,z)"
aR.Parent = aJ
aL = aL + aK

local aS = Instance.new("TextBox")
aS.Size = UDim2.new(1, 0, aK, 0)
aS.Position = UDim2.new(0, 0, aL, 0)
aS.PlaceholderText = "handle color (r,g,b)"
aS.Parent = aJ
aL = aL + aK

local aT = Instance.new("TextBox")
aT.Size = UDim2.new(1, 0, aK, 0)
aT.Position = UDim2.new(0, 0, aL, 0)
aT.PlaceholderText = "handle material (e.g., plastic)"
aT.Parent = aJ
aL = aL + aK

local aU = Instance.new("TextBox")
aU.Size = UDim2.new(1, 0, aK, 0)
aU.Position = UDim2.new(0, 0, aL, 0)
aU.PlaceholderText = "handle transparency (0-1)"
aU.Parent = aJ
aL = aL + aK

local aV = Instance.new("TextBox")
aV.Size = UDim2.new(1, 0, aK, 0)
aV.Position = UDim2.new(0, 0, aL, 0)
aV.PlaceholderText = "handle reflectance (0-1)"
aV.Parent = aJ
aL = aL + aK

aJ.CanvasSize = UDim2.new(0, 0, aL, 0)

local aW = Instance.new("TextButton")
aW.Size = UDim2.new(0.8, 0, 0.15, 0)
aW.Position = UDim2.new(0.1, 0, 0.8, 0)
aW.Text = "create tool"
aW.Parent = aF

aI.MouseButton1Click:Connect(function()
    aJ.Visible = not aJ.Visible
    if aJ.Visible then
        aI.Text = "advanced options (on)"
    else
        aI.Text = "advanced options"
    end
end)

aW.MouseButton1Click:Connect(function()
    local aX = aH.Text
    if aX ~= "" then
        local aY = a:FindFirstChild("Backpack")
        if not aY then
            aY = Instance.new("Folder")
            aY.Name = "backpack"
            aY.Parent = a
        end
        local aZ = Instance.new("Tool")
        aZ.Name = aX
        local a0 = Instance.new("Part")
        a0.Name = "handle"
        local a1 = Vector3.new(1, 1, 1)
        local a2 = Color3.new(1, 1, 1)
        local a3 = Enum.Material.Plastic
        local a4 = 0
        local a5 = 0
        local a6 = ""
        local a7 = true
        local a8 = true
        local a9, a10 = nil, nil
        if aJ.Visible then
            a6 = aM.Text or ""
            if aN.Text ~= "" then a7 = (string.lower(aN.Text) == "true") end
            if aO.Text ~= "" then a8 = (string.lower(aO.Text) == "true") end
            if aP.Text ~= "" then
                local a11 = string.split(aP.Text, ",")
                if #a11 == 3 then
                    local a12 = tonumber(a11[1])
                    local a13 = tonumber(a11[2])
                    local a14 = tonumber(a11[3])
                    if a12 and a13 and a14 then
                        a9 = Vector3.new(a12, a13, a14)
                    end
                end
            end
            if aQ.Text ~= "" then
                local a15 = string.split(aQ.Text, ",")
                if #a15 == 3 then
                    local a16 = tonumber(a15[1])
                    local a17 = tonumber(a15[2])
                    local a18 = tonumber(a15[3])
                    if a16 and a17 and a18 then
                        a10 = Vector3.new(a16, a17, a18)
                    end
                end
            end
            if aR.Text ~= "" then
                local a19 = string.split(aR.Text, ",")
                if #a19 == 3 then
                    local a1A = tonumber(a19[1])
                    local a1B = tonumber(a19[2])
                    local a1C = tonumber(a19[3])
                    if a1A and a1B and a1C then
                        a1 = Vector3.new(a1A, a1B, a1C)
                    end
                end
            end
            if aS.Text ~= "" then
                local a1D = string.split(aS.Text, ",")
                if #a1D == 3 then
                    local a1E = tonumber(a1D[1])
                    local a1F = tonumber(a1D[2])
                    local a1G = tonumber(a1D[3])
                    if a1E and a1F and a1G then
                        a2 = Color3.new(a1E, a1F, a1G)
                    end
                end
            end
            if aT.Text ~= "" then
                local a1H, a1I = pcall(function() return Enum.Material[aT.Text] end)
                if a1H and a1I then
                    a3 = a1I
                end
            end
            if aU.Text ~= "" then
                local a1J = tonumber(aU.Text)
                if a1J then a4 = a1J end
            end
            if aV.Text ~= "" then
                local a1K = tonumber(aV.Text)
                if a1K then a5 = a1K end
            end
        end
        aZ.ToolTip = a6
        aZ.RequiresHandle = a7
        aZ.CanBeDropped = a8
        if a9 then aZ.Grip = a9 end
        if a10 then aZ.GripPos = a10 end
        a0.Size = a1
        a0.Color = a2
        a0.Material = a3
        a0.Transparency = a4
        a0.Reflectance = a5
        a0.Parent = aZ
        aZ.Parent = aY
        print("new tool created: " .. aX)
    else
        print("please enter a valid tool name.")
    end
end)

-- connect main ui buttons to their corresponding frames
j.MouseButton1Click:Connect(function()
    c.Visible = false
    o.Visible = true
end)
k.MouseButton1Click:Connect(function()
    c.Visible = false
    v.Visible = true
    ad()
end)
l.MouseButton1Click:Connect(function()
    c.Visible = false
    ae.Visible = true
    am()
end)
m.MouseButton1Click:Connect(function()
    c.Visible = false
    au.Visible = true
end)
n.MouseButton1Click:Connect(function()
    c.Visible = false
    aF.Visible = true
end)

--[[
legacy code removed for clarity and to avoid errors in a lua executor:
mousebutton1click:connect(function()
    mainframe.visible = false
    selectframe.visible = true
    updatetoollist()
end)

guimodebutton.mousebutton1click:connect(function()
    mainframe.visible = false
    guilabelframe.visible = true
    updateguilist()
end)

teleportmodebutton.mousebutton1click:connect(function()
    mainframe.visible = false
    teleportframe.visible = true
end)

newtoolmodebutton.mousebutton1click:connect(function()
    mainframe.visible = false
    newtoolframe.visible = true
end)
]]
