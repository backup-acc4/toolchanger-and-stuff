-- rebarded revisited!1!!
--yeahyeah this v2
--NOT FROM ULREAKILL
--*ultrakill
-- # my roblox user is McBlocker real!!!! #
--anyways take this early release v2
--bongbong
--mrman i dare you to not skid :imp-evil:
-- Helper function to decode an array of ASCII decimals into a string.
local function dec(arr)
    local s = ""
    for i = 1, #arr do
        s = s .. string.char(arr[i])
    end
    return s
end
local function send(text)
	local StarterGui = game:GetService("StarterGui")
	StarterGui:SetCore("SendNotification",{
		Title = "loaded", -- You can remove this, idc
		Text = text,
		Duration = 5
	})
end
send("TOOLCHANGER v2 thing made by backup-acc4/interactable object/kev")
local a = game:GetService(dec({80,108,97,121,101,114,115}))[dec({76,111,99,97,108,80,108,97,121,101,114})]
local b = Instance.new(dec({83,99,114,101,101,110,71,117,105}))
b.Name = dec({117,105,32,116,104,105,110,103,121,32,118,49,46,53})
b.Parent = game[dec({67,111,114,101,71,117,105})]

-- main ui frame enlarged to 600px tall
local c = Instance.new(dec({70,114,97,109,101}))
c.Size = UDim2.new(0, 400, 0, 600)
c.Position = UDim2.new(0.5, -200, 0.3, 0)
c.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
c.Active = true
c.Draggable = true
c.Parent = b

local d = Instance.new(dec({84,101,120,116,76,97,98,101,108}))
d.Size = UDim2.new(1, 0, 0.15, 0)
d.Position = UDim2.new(0, 0, 0, 0)
d.Text = dec({117,105,32,116,104,105,110,103,121,32,118,50})
d.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
d.Parent = c

local e = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
e.Size = UDim2.new(0.2, 0, 0.1, 0)
e.Position = UDim2.new(0.8, 0, 0, 0)
e.Text = dec({120})
e.TextScaled = true
e.Parent = c
e.MouseButton1Click:Connect(function()
    b:Destroy()
end)

local f = false
local g = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
g.Size = UDim2.new(0.2, 0, 0.1, 0)
g.Position = UDim2.new(0.6, 0, 0, 0)
g.Text = dec({95})
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

local i = Instance.new(dec({84,101,120,116,76,97,98,101,108}))
i.Size = UDim2.new(0, 320, 0, 60)
i.Position = UDim2.new(0.1, 0, 0.15, 0)
i.Text = dec({115,101,108,101,99,116,32,97,108,103,111,114,105,116,104,109,58})
i.BackgroundTransparency = 1
i.Parent = c

-- for 7 buttons, evenly space them from scale 0.25 to 1.0
local btnPositions = {0.25, 0.357, 0.464, 0.571, 0.679, 0.786, 0.893}
local btnHeight = 0.107

local j = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
j.Size = UDim2.new(0.8, 0, btnHeight, 0)
j.Position = UDim2.new(0.1, 0, btnPositions[1], 0)
j.Text = dec({104,111,108,100,32,117,114,32,116,111,111,108,32,111,117,116,32,97,110,100,32,119,101,32,100,111,32,105,116})
j.Parent = c

local k = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
k.Size = UDim2.new(0.8, 0, btnHeight, 0)
k.Position = UDim2.new(0.1, 0, btnPositions[2], 0)
k.Text = dec({115,101,108,101,99,116,32,117,114,32,116,111,111,108,32,97,110,100,32,119,101,32,100,111,32,105,116})
k.Parent = c

local l = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
l.Size = UDim2.new(0.8, 0, btnHeight, 0)
l.Position = UDim2.new(0.1, 0, btnPositions[3], 0)
l.Text = dec({103,117,105,32,99,104,97,110,103,101,114,32,40,101,120,112,101,114,105,109,101,110,116,97,108,41})
l.Parent = c

local m = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
m.Size = UDim2.new(0.8, 0, btnHeight, 0)
m.Position = UDim2.new(0.1, 0, btnPositions[4], 0)
m.Text = dec({116,101,108,101,112,111,114,116})
m.Parent = c

local n = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
n.Size = UDim2.new(0.8, 0, btnHeight, 0)
n.Position = UDim2.new(0.1, 0, btnPositions[5], 0)
n.Text = dec({109,97,107,101,32,110,101,119,32,116,111,111,108})
n.Parent = c

local f3x = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
f3x.Size = UDim2.new(0.8, 0, btnHeight, 0)
f3x.Position = UDim2.new(0.1, 0, btnPositions[6], 0)
f3x.Text = dec({102,51,120})
f3x.Parent = c
f3x.MouseButton1Click:Connect(function()
    local backpack = a:WaitForChild(dec({66,97,99,107,112,97,99,107}))
    
    local hammer = Instance.new(dec({72,111,112,112,101,114,66,105,110}))
    hammer.Name = dec({104,97,109,109,101,114})
    hammer.BinType = 4
    hammer.Parent = backpack

    local cloneTool = Instance.new(dec({72,111,112,112,101,114,66,105,110}))
    cloneTool.Name = dec({99,108,111,110,101})
    cloneTool.BinType = 3
    cloneTool.Parent = backpack

    local grabTool = Instance.new(dec({72,111,112,112,101,114,66,105,110}))
    grabTool.Name = dec({103,114,97,98})
    grabTool.BinType = 2
    grabTool.Parent = backpack

    print(dec({104,111,112,112,101,114,98,105,110,115,32,97,100,100,101,100,58,32,104,97,109,109,101,114,44,32,99,108,111,110,101,44,32,103,114,97,98}))
end)

-- new "humanoid editor" button replaces the previous walkspeed button
local heButton = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
heButton.Size = UDim2.new(0.8, 0, btnHeight, 0)
heButton.Position = UDim2.new(0.1, 0, btnPositions[7], 0)
heButton.Text = dec({104,117,109,97,110,111,105,100,32,101,100,105,116,111,114})
heButton.Parent = c

--------------------------------------------------
-- humanoid editor frame
--------------------------------------------------
local humanoidEditorFrame = Instance.new(dec({70,114,97,109,101}))
humanoidEditorFrame.Size = UDim2.new(0, 400, 0, 400)
humanoidEditorFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
humanoidEditorFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
humanoidEditorFrame.Active = true
humanoidEditorFrame.Draggable = true
humanoidEditorFrame.Visible = false
humanoidEditorFrame.Parent = b

local heClose = e:Clone()
heClose.Parent = humanoidEditorFrame
heClose.Text = dec({120})
heClose.MouseButton1Click:Connect(function()
    humanoidEditorFrame.Visible = false
    c.Visible = true
end)

-- list of humanoid properties to edit (property names must remain unchanged for the api)
local humanoidProperties = {dec({87,97,108,107,83,112,101,101,100}), dec({74,117,109,112,80,111,119,101,114}), dec({72,105,112,72,101,105,103,104,116}), dec({72,101,97,108,116,104}), dec({77,97,120,72,101,97,108,116,104})}

local heScrollingFrame = Instance.new(dec({83,99,114,111,108,108,105,110,103,70,114,97,109,101}))
heScrollingFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
heScrollingFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
heScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
heScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #humanoidProperties * 35)
heScrollingFrame.Parent = humanoidEditorFrame

local heElements = {}
for i, prop in ipairs(humanoidProperties) do
    local label = Instance.new(dec({84,101,120,116,76,97,98,101,108}))
    label.Size = UDim2.new(0.4, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
    label.Text = string.lower(prop)
    label.BackgroundTransparency = 1
    label.Parent = heScrollingFrame

    local textbox = Instance.new(dec({84,101,120,116,66,111,120}))
    textbox.Size = UDim2.new(0.5, 0, 0, 30)
    textbox.Position = UDim2.new(0.45, 0, 0, (i - 1) * 35)
    textbox.PlaceholderText = dec({118,97,108,117,101})
    textbox.Parent = heScrollingFrame

    heElements[prop] = textbox
end

local heApplyButton = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
heApplyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
heApplyButton.Position = UDim2.new(0.1, 0, 0.88, 0)
heApplyButton.Text = dec({97,112,112,108,121,32,99,104,97,110,103,101,115})
heApplyButton.Parent = humanoidEditorFrame
heApplyButton.MouseButton1Click:Connect(function()
    local character = a.Character or a.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass(dec({72,117,109,97,110,111,105,100}))
    if humanoid then
        for _, prop in ipairs(humanoidProperties) do
            local newVal = tonumber(heElements[prop].Text)
            if newVal then
                humanoid[prop] = newVal
                print(string.lower(prop) .. dec({32,115,101,116,32,116,111,58,32}) .. newVal)
            end
        end
    else
        print(dec({104,117,109,97,110,111,105,100,32,110,111,116,32,102,111,117,110,100}))
    end
end)

local function refreshHumanoidEditor()
    local character = a.Character or a.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass(dec({72,117,109,97,110,111,105,100}))
    if humanoid then
        for _, prop in ipairs(humanoidProperties) do
            local value = humanoid[prop]
            heElements[prop].Text = tostring(value)
        end
    end
end

heButton.MouseButton1Click:Connect(function()
    refreshHumanoidEditor()
    humanoidEditorFrame.Visible = true
    c.Visible = false
end)

--------------------------------------------------
-- the rest of the ui frames remain unchanged below
--------------------------------------------------

local o = Instance.new(dec({70,114,97,109,101}))
o.Size = UDim2.new(0, 400, 0, 300)
o.Position = UDim2.new(0.5, -200, 0.3, 0)
o.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
o.Active = true
o.Draggable = true
o.Visible = false
o.Parent = b

local p = e:Clone()
p.Parent = o
p.Text = dec({120})
p.MouseButton1Click:Connect(function()
    o.Visible = false
    c.Visible = true
end)

local q = Instance.new(dec({84,101,120,116,66,111,120}))
q.Size = UDim2.new(0.8, 0, 0.2, 0)
q.Position = UDim2.new(0.1, 0, 0.35, 0)
q.PlaceholderText = dec({110,101,119,32,110,97,109,101})
q.Parent = o

local r = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
r.Size = UDim2.new(0.8, 0, 0.2, 0)
r.Position = UDim2.new(0.1, 0, 0.65, 0)
r.Text = dec({114,101,110,97,109,101})
r.Parent = o
r.MouseButton1Click:Connect(function()
    local s1 = q.Text
    if s1 ~= "" then
        local t1 = a.Character
        if t1 then
            local u1 = t1:FindFirstChildOfClass(dec({84,111,111,108}))
            if u1 then
                u1.Name = s1
                print(dec({116,111,111,108,32,114,101,110,97,109,101,100,32,116,111,58,32}) .. s1)
            else
                print(dec({110,111,32,116,111,111,108,32,101,113,117,105,112,112,101,100,46}))
            end
        end
    end
end)

local v = Instance.new(dec({70,114,97,109,101}))
v.Size = UDim2.new(0, 400, 0, 500)
v.Position = UDim2.new(0.5, -200, 0.3, 0)
v.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
v.Active = true
v.Draggable = true
v.Visible = false
v.Parent = b

local w = e:Clone()
w.Parent = v
w.Text = dec({120})
w.MouseButton1Click:Connect(function()
    v.Visible = false
    c.Visible = true
end)

local x = Instance.new(dec({83,99,114,111,108,108,105,110,103,70,114,97,109,101}))
x.Size = UDim2.new(0.9, 0, 0.4, 0)
x.Position = UDim2.new(0.05, 0, 0.15, 0)
x.CanvasSize = UDim2.new(0, 0, 5, 0)
x.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
x.Parent = v
x.ChildAdded:Connect(function()
    local z = 0
    for _, y in pairs(x:GetChildren()) do
        if y:IsA(dec({84,101,120,116,66,117,116,116,111,110})) then
            z = z + 1
        end
    end
    x.CanvasSize = UDim2.new(0, 0, 0, z * 30)
end)

local aa = Instance.new(dec({84,101,120,116,66,111,120}))
aa.Size = UDim2.new(0.9, 0, 0.15, 0)
aa.Position = UDim2.new(0.05, 0, 0.58, 0)
aa.PlaceholderText = dec({101,110,116,101,114,32,110,101,119,32,116,111,111,108,32,110,97,109,101})
aa.Parent = v

local ab = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
ab.Size = UDim2.new(0.9, 0, 0.15, 0)
ab.Position = UDim2.new(0.05, 0, 0.75, 0)
ab.Text = dec({114,101,110,97,109,101,32,116,111,111,108})
ab.Parent = v

local ac = nil
local function ad()
    for _, ae in pairs(x:GetChildren()) do
        if ae:IsA(dec({84,101,120,116,66,117,116,116,111,110})) then
            ae:Destroy()
        end
    end
    local ah = a:FindFirstChild(dec({66,97,99,107,112,97,99,107}))
    if ah then
        for _, af in pairs(ah:GetChildren()) do
            if af:IsA(dec({84,111,111,108})) then
                local ag = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
                ag.Size = UDim2.new(1, 0, 0, 30)
                ag.Text = string.lower(af.Name)
                ag.Parent = x
                ag.MouseButton1Click:Connect(function()
                    ac = af
                    print(dec({115,101,108,101,99,116,101,100,32,116,111,111,108,58,32}) .. af.Name)
                end)
            end
        end
    end
end
ab.MouseButton1Click:Connect(function()
    local af1 = aa.Text
    if af1 ~= "" and ac then
        ac.Name = af1
        print(dec({115,101,108,101,99,116,101,100,32,116,111,111,108,32,114,101,110,97,109,101,100,32,116,111,58,32}) .. af1)
    else
        print(dec({110,111,32,116,111,111,108,32,115,101,108,101,99,116,101,100,32,111,114,32,110,97,109,101,32,101,109,112,116,121,46}))
    end
end)

local ae = Instance.new(dec({70,114,97,109,101}))
ae.Size = UDim2.new(0, 400, 0, 500)
ae.Position = UDim2.new(0.5, -200, 0.3, 0)
ae.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ae.Active = true
ae.Draggable = true
ae.Visible = false
ae.Parent = b

local af = e:Clone()
af.Parent = ae
af.Text = dec({120})
af.MouseButton1Click:Connect(function()
    ae.Visible = false
    c.Visible = true
end)

local ag = Instance.new(dec({83,99,114,111,108,108,105,110,103,70,114,97,109,101}))
ag.Size = UDim2.new(0.9, 0, 0.4, 0)
ag.Position = UDim2.new(0.05, 0, 0.15, 0)
ag.CanvasSize = UDim2.new(0, 0, 5, 0)
ag.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ag.Parent = ae
ag.ChildAdded:Connect(function()
    local ah1 = 0
    for _, ai in pairs(ag:GetChildren()) do
        if ai:IsA(dec({84,101,120,116,66,117,116,116,111,110})) then
            ah1 = ah1 + 1
        end
    end
    ag.CanvasSize = UDim2.new(0, 0, 0, ah1 * 30)
end)

local aj = Instance.new(dec({84,101,120,116,66,111,120}))
aj.Size = UDim2.new(0.9, 0, 0.15, 0)
aj.Position = UDim2.new(0.05, 0, 0.58, 0)
aj.PlaceholderText = dec({101,110,116,101,114,32,110,101,119,32,116,101,120,116})
aj.Parent = ae

local ak = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
ak.Size = UDim2.new(0.9, 0, 0.15, 0)
ak.Position = UDim2.new(0.05, 0, 0.75, 0)
ak.Text = dec({99,104,97,110,103,101,32,116,101,120,116})
ak.Parent = ae

local al = nil
local function am()
    for _, an in pairs(ag:GetChildren()) do
        if an:IsA(dec({84,101,120,116,66,117,116,116,111,110})) then
            an:Destroy()
        end
    end
    local ao = a:FindFirstChildOfClass(dec({80,108,97,121,101,114,71,117,105}))
    if ao then
        for _, ap in pairs(ao:GetChildren()) do
            if ap:IsA(dec({83,99,114,101,101,110,71,117,105})) then
                local aq = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
                aq.Size = UDim2.new(1, 0, 0, 30)
                aq.Text = string.lower(ap.Name)
                aq.Parent = ag
                aq.MouseButton1Click:Connect(function()
                    al = ap
                    print(dec({115,101,108,101,99,116,101,100,32,103,117,105,58,32}) .. ap.Name)
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
            if at:IsA(dec({84,101,120,116,76,97,98,101,108})) then
                as = at
                break
            end
        end
        if as then
            as.Text = string.lower(ar)
            print(dec({116,101,120,116,108,97,98,101,108,32,105,110,32}) .. al.Name .. dec({32,99,104,97,110,103,101,100,32,116,111,58,32}) .. string.lower(ar))
        else
            print(dec({110,111,32,116,101,120,116,108,97,98,101,108,32,102,111,117,110,100,32,105,110,32,115,101,108,101,99,116,101,100,32,103,117,105,46}))
        end
    else
        print(dec({110,111,32,103,117,105,32,115,101,108,101,99,116,101,100,32,111,114,32,116,101,120,116,32,101,109,112,116,121,46}))
    end
end)

local au = Instance.new(dec({70,114,97,109,101}))
au.Size = UDim2.new(0, 400, 0, 300)
au.Position = UDim2.new(0.5, -200, 0.3, 0)
au.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
au.Active = true
au.Draggable = true
au.Visible = false
au.Parent = b

local av = e:Clone()
av.Parent = au
av.Text = dec({120})
av.MouseButton1Click:Connect(function()
    au.Visible = false
    c.Visible = true
end)

local aw = Instance.new(dec({84,101,120,116,66,111,120}))
aw.Size = UDim2.new(0.8, 0, 0.2, 0)
aw.Position = UDim2.new(0.1, 0, 0.35, 0)
aw.PlaceholderText = dec({101,110,116,101,114,32,116,101,108,101,112,111,114,116,32,118,101,99,116,111,114,51,32,40,120,44,121,44,122,41})
aw.Parent = au

local ax = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
ax.Size = UDim2.new(0.8, 0, 0.2, 0)
ax.Position = UDim2.new(0.1, 0, 0.65, 0)
ax.Text = dec({116,101,108,101,112,111,114,116})
ax.Parent = au
ax.MouseButton1Click:Connect(function()
    local ay = aw.Text
    if ay ~= "" then
        local az = string.split(ay, dec({44}))
        if #az == 3 then
            local aA = tonumber(az[1])
            local aB = tonumber(az[2])
            local aC = tonumber(az[3])
            if aA and aB and aC then
                local aD = a.Character
                if aD and aD:FindFirstChild(dec({104,117,109,97,110,111,105,100,114,111,111,116,112,97,114,116})) then
                    aD:MoveTo(Vector3.new(aA, aB, aC))
                    print(dec({116,101,108,101,112,111,114,116,101,100,32,116,111,58,32}) .. string.lower(ay))
                else
                    print(dec({99,104,97,114,97,99,116,101,114,32,111,114,32,104,117,109,97,110,111,105,100,114,111,111,116,112,97,114,116,32,110,111,116,32,102,111,117,110,100}))
                end
            else
                print(dec({105,110,118,97,108,105,100,32,118,101,99,116,111,114,51,32,105,110,112,117,116,46}))
            end
        else
            print(dec({101,110,116,101,114,32,97,32,118,97,108,105,100,32,118,101,99,116,111,114,51,32,105,110,32,116,104,101,32,102,111,114,109,97,116,32,120,44,121,44,122}))
        end
    else
        print(dec({112,108,101,97,115,101,32,101,110,116,101,114,32,97,32,116,101,108,101,112,111,114,116,32,108,111,99,97,116,105,111,110,46}))
    end
end)

local aF = Instance.new(dec({70,114,97,109,101}))
aF.Size = UDim2.new(0, 400, 0, 350)
aF.Position = UDim2.new(0.5, -200, 0.3, 0)
aF.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
aF.Active = true
aF.Draggable = true
aF.Visible = false
aF.Parent = b

local aG = e:Clone()
aG.Parent = aF
aG.Text = dec({120})
aG.MouseButton1Click:Connect(function()
    aF.Visible = false
    c.Visible = true
end)

local aH = Instance.new(dec({84,101,120,116,66,111,120}))
aH.Size = UDim2.new(0.8, 0, 0.15, 0)
aH.Position = UDim2.new(0.1, 0, 0.15, 0)
aH.PlaceholderText = dec({110,101,119,32,116,111,111,108,32,110,97,109,101})
aH.Parent = aF

local aI = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
aI.Size = UDim2.new(0.8, 0, 0.15, 0)
aI.Position = UDim2.new(0.1, 0, 0.35, 0)
aI.Text = dec({97,100,118,97,110,99,101,100,32,111,112,116,105,111,110,115})
aI.Parent = aF

local aJ = Instance.new(dec({83,99,114,111,108,108,105,110,103,70,114,97,109,101}))
aJ.Size = UDim2.new(0.9, 0, 0.5, 0)
aJ.Position = UDim2.new(0.05, 0, 0.5, 0)
aJ.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
aJ.Visible = false
aJ.Parent = aF

local aK = 0.15
local aL = 0
local aM = Instance.new(dec({84,101,120,116,66,111,120}))
aM.Size = UDim2.new(1, 0, aK, 0)
aM.Position = UDim2.new(0, 0, aL, 0)
aM.PlaceholderText = dec({116,111,111,108,116,105,112,32,40,111,112,116,105,111,110,97,108,41})
aM.Parent = aJ
aL = aL + aK

local aN = Instance.new(dec({84,101,120,116,66,111,120}))
aN.Size = UDim2.new(1, 0, aK, 0)
aN.Position = UDim2.new(0, 0, aL, 0)
aN.PlaceholderText = dec({114,101,113,117,105,114,101,115,104,97,110,100,108,101,32,40,116,114,117,101,47,102,97,108,115,101,41})
aN.Parent = aJ
aL = aL + aK

local aO = Instance.new(dec({84,101,120,116,66,111,120}))
aO.Size = UDim2.new(1, 0, aK, 0)
aO.Position = UDim2.new(0, 0, aL, 0)
aO.PlaceholderText = dec({99,97,110,98,101,100,114,111,112,112,101,100,32,40,116,114,117,101,47,102,97,108,115,101,41})
aO.Parent = aJ
aL = aL + aK

local aP = Instance.new(dec({84,101,120,116,66,111,120}))
aP.Size = UDim2.new(1, 0, aK, 0)
aP.Position = UDim2.new(0, 0, aL, 0)
aP.PlaceholderText = dec({103,114,105,112,32,40,120,44,121,44,122,41})
aP.Parent = aJ
aL = aL + aK

local aQ = Instance.new(dec({84,101,120,116,66,111,120}))
aQ.Size = UDim2.new(1, 0, aK, 0)
aQ.Position = UDim2.new(0, 0, aL, 0)
aQ.PlaceholderText = dec({103,114,105,112,112,111,115,32,40,120,44,121,44,122,41})
aQ.Parent = aJ
aL = aL + aK

local aR = Instance.new(dec({84,101,120,116,66,111,120}))
aR.Size = UDim2.new(1, 0, aK, 0)
aR.Position = UDim2.new(0, 0, aL, 0)
aR.PlaceholderText = dec({104,97,110,100,108,101,32,115,105,122,101,32,40,120,44,121,44,122,41})
aR.Parent = aJ
aL = aL + aK

local aS = Instance.new(dec({84,101,120,116,66,111,120}))
aS.Size = UDim2.new(1, 0, aK, 0)
aS.Position = UDim2.new(0, 0, aL, 0)
aS.PlaceholderText = dec({104,97,110,100,108,101,32,99,111,108,111,114,32,40,114,44,103,44,98,41})
aS.Parent = aJ
aL = aL + aK

local aT = Instance.new(dec({84,101,120,116,66,111,120}))
aT.Size = UDim2.new(1, 0, aK, 0)
aT.Position = UDim2.new(0, 0, aL, 0)
aT.PlaceholderText = dec({104,97,110,100,108,101,32,109,97,116,101,114,105,97,108,32,40,101,44,32,112,108,97,115,116,105,99,41})
aT.Parent = aJ
aL = aL + aK

local aU = Instance.new(dec({84,101,120,116,66,111,120}))
aU.Size = UDim2.new(1, 0, aK, 0)
aU.Position = UDim2.new(0, 0, aL, 0)
aU.PlaceholderText = dec({104,97,110,100,108,101,32,116,114,97,110,115,112,97,114,101,110,99,121,32,40,48,45,49,41})
aU.Parent = aJ
aL = aL + aK

local aV = Instance.new(dec({84,101,120,116,66,111,120}))
aV.Size = UDim2.new(1, 0, aK, 0)
aV.Position = UDim2.new(0, 0, aL, 0)
aV.PlaceholderText = dec({104,97,110,100,108,101,32,114,101,102,108,101,99,116,97,110,99,101,32,40,48,45,49,41})
aV.Parent = aJ
aL = aL + aK

aJ.CanvasSize = UDim2.new(0, 0, aL, 0)

local aW = Instance.new(dec({84,101,120,116,66,117,116,116,111,110}))
aW.Size = UDim2.new(0.8, 0, 0.15, 0)
aW.Position = UDim2.new(0.1, 0, 0.8, 0)
aW.Text = dec({99,114,101,97,116,101,32,116,111,111,108})
aW.Parent = aF

aI.MouseButton1Click:Connect(function()
    aJ.Visible = not aJ.Visible
    if aJ.Visible then
        aI.Text = dec({97,100,118,97,110,99,101,100,32,111,112,116,105,111,110,115,32,40,111,110,41})
    else
        aI.Text = dec({97,100,118,97,110,99,101,100,32,111,112,116,105,111,110,115})
    end
end)

aW.MouseButton1Click:Connect(function()
    local aX = aH.Text
    if aX ~= "" then
        local aY = a:FindFirstChild(dec({66,97,99,107,112,97,99,107}))
        if not aY then
            aY = Instance.new(dec({70,111,108,100,101,114}))
            aY.Name = dec({98,97,99,107,112,97,99,107})
            aY.Parent = a
        end
        local aZ = Instance.new(dec({84,111,111,108}))
        aZ.Name = aX
        local a0 = Instance.new(dec({80,97,114,116}))
        a0.Name = dec({104,97,110,100,108,101})
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
                local a11 = string.split(aP.Text, dec({44}))
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
                local a15 = string.split(aQ.Text, dec({44}))
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
                local a19 = string.split(aR.Text, dec({44}))
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
                local a1D = string.split(aS.Text, dec({44}))
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
        print(dec({110,101,119,32,116,111,111,108,32,99,114,101,97,116,101,100,58,32}) .. aX)
    else
        print(dec({112,108,101,97,115,101,32,101,110,116,101,114,32,97,32,118,97,108,105,100,32,116,111,111,108,32,110,97,109,101,46}))
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

