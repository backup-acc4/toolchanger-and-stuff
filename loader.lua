local v0='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function v1(v2) v2=string.gsub(v2,'[^'..v0..'=]','') return (v2:gsub('.',function(v3) if(v3=='=')then return '' end local v4='' local v5=(string.find(v0,v3,1,true)-1) for v6=6,1,-1 do v4=v4..(v5%2^v6 - v5%2^(v6-1)>0 and '1' or '0') end return v4 end):gsub("........",function(v7) local v8=0 for v9=1,8 do v8=v8+((v7:sub(v9,v9)=='1')and 2^(8-v9)or 0) end return string.char(v8) end)) end
local function s(v10)return v1(v10)end

local v11=game:GetService(s("UHJheXBlcnM=")).LocalPlayer
local v12=Instance.new(s("U2NyZWVuR2l1"))
v12.Name=s("dWkgdGhpbmd5IHYxLjU=")
v12.Parent=game[s("Q29yZUdnaQ==")]

local v13=Instance.new(s("RnJhbWU="))
v13.Size=UDim2.new(0,400,0,500)
v13.Position=UDim2.new(0.5,-200,0.3,0)
v13.BackgroundColor3=Color3.new(0.2,0.2,0.2)
v13.Active=true
v13.Draggable=true
v13.Parent=v12

local v14=Instance.new(s("VGV4dExhYmVs"))
v14.Size=UDim2.new(1,0,0.15,0)
v14.Position=UDim2.new(0,0,0,0)
v14.Text=s("dG9vbGNoYW5nZXIgdjEuNCAoZ3VpIGV4cGVyaW1lbnRhbCk=")
v14.BackgroundColor3=Color3.new(0.1,0.1,0.1)
v14.Parent=v13

local v15=Instance.new(s("VGV4dEJ1dHRvbg=="))
v15.Size=UDim2.new(0.2,0,0.1,0)
v15.Position=UDim2.new(0.8,0,0,0)
v15.Text=s("eA==")
v15.TextScaled=true
v15.Parent=v13
v15.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHYxMjpEZXN0cm95KCkgZW5k"))))

local v16=false
local v17=Instance.new(s("VGV4dEJ1dHRvbg=="))
v17.Size=UDim2.new(0.2,0,0.1,0)
v17.Position=UDim2.new(0.6,0,0,0)
v17.Text=s("Xw==")
v17.TextScaled=true
v17.Parent=v13
v17.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IGlmIG5vdCB2MTYgdGhlbih2MTYpIHRoZW4gZm9yIGs6IGZvciBjaGlsZCBpbiBpcGVhcnMoKSB7IGlmIChjaGlsZCAhPT0gdi5hbGlhKHRleHQpKSB7IGNoaWxkLlZpc2libGUgPSBmYWxzZSB9IGVuZCBmb3IgaywgY2hpbGQgIT0gdi5hbGlhKHRleHQpIHRoZW4gY2hpbGQuVmlzaWJsZSA9IHRydWUgfSBmb3IgaywgY2hpbGQgIT0gdi5hbGlhKHRleHQpIHRoZW4gY2hpbGQuVmlzaWJsZSA9IGZhbHNlIH0gdi5hbGlhKHRleHQpID0gdHJ1ZSBpbnNlZCBlbmQgZW5k"))))

local v18=Instance.new(s("VGV4dEJ1dHRvbg=="))
v18.Size=UDim2.new(0.8,0,0.1,0)
v18.Position=UDim2.new(0.1,0,0.15,0)
v18.Text=s("c2VsZWN0IGFsZ29yaXRobw==")
v18.BackgroundTransparency=1
v18.Parent=v13

local v19=Instance.new(s("VGV4dEJ1dHRvbg=="))
v19.Size=UDim2.new(0.8,0,0.15,0)
v19.Position=UDim2.new(0.1,0,0.25,0)
v19.Text=s("aG9sZCB1ciB0b29sIG91dCBhbmQgd2UgZG8gaXQ=")
v19.Parent=v13

local v20=Instance.new(s("VGV4dEJ1dHRvbg=="))
v20.Size=UDim2.new(0.8,0,0.15,0)
v20.Position=UDim2.new(0.1,0,0.40,0)
v20.Text=s("c2VsZWN0IHVyIHRvb2wgYW5kIHdlIGRvIGl0")
v20.Parent=v13

local v21=Instance.new(s("VGV4dEJ1dHRvbg=="))
v21.Size=UDim2.new(0.8,0,0.15,0)
v21.Position=UDim2.new(0.1,0,0.55,0)
v21.Text=s("Z3VpIGNoYW5nZXIgKGV4cGVyaW1lbnRhbCk=")
v21.Parent=v13

local v22=Instance.new(s("VGV4dEJ1dHRvbg=="))
v22.Size=UDim2.new(0.8,0,0.15,0)
v22.Position=UDim2.new(0.1,0,0.70,0)
v22.Text=s("dGVsZXBvcnQ=")
v22.Parent=v13

local v23=Instance.new(s("VGV4dEJ1dHRvbg=="))
v23.Size=UDim2.new(0.8,0,0.15,0)
v23.Position=UDim2.new(0.1,0,0.85,0)
v23.Text=s("bWFrZSBuZXcgdG9vbA==")
v23.Parent=v13

local v24=Instance.new(s("RnJhbWU="))
v24.Size=UDim2.new(0,400,0,300)
v24.Position=UDim2.new(0.5,-200,0.3,0)
v24.BackgroundColor3=Color3.new(0.2,0.2,0.2)
v24.Active=true
v24.Draggable=true
v24.Visible=false
v24.Parent=v12

local v25=v15:Clone()
v25.Parent=v24
v25.Text=s("eA==")
v25.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHYyNDpWaXNpYmxlKCkgZW5k"))))

local v26=Instance.new(s("VGV4dFRleGJveA=="))
v26.Size=UDim2.new(0.8,0,0.2,0)
v26.Position=UDim2.new(0.1,0,0.35,0)
v26.PlaceholderText=s("bmV3IG5hbWU=")
v26.Parent=v24

local v27=Instance.new(s("VGV4dEJ1dHRvbg=="))
v27.Size=UDim2.new(0.8,0,0.2,0)
v27.Position=UDim2.new(0.1,0,0.65,0)
v27.Text=s("cmVuYW1l")
v27.Parent=v24
v27.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHYyNjpSZW5hbWUodG9vbCkgZW5k"))))

local v28=Instance.new(s("RnJhbWU="))
v28.Size=UDim2.new(0,400,0,500)
v28.Position=UDim2.new(0.5,-200,0.3,0)
v28.BackgroundColor3=Color3.new(0.2,0.2,0.2)
v28.Active=true
v28.Draggable=true
v28.Visible=false
v28.Parent=v12

local v29=v15:Clone()
v29.Parent=v28
v29.Text=s("eA==")
v29.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHYyODpTZXRDbG9zZSgpIGVuZA=="))))

local v30=Instance.new(s("U2Nyb2xsaW5nRnJhbWU="))
v30.Size=UDim2.new(0.9,0,0.4,0)
v30.Position=UDim2.new(0.05,0,0.15,0)
v30.CanvasSize=UDim2.new(0,0,5,0)
v30.BackgroundColor3=Color3.new(0.15,0.15,0.15)
v30.Parent=v28
v30.ChildAdded:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IGxvY2FsIGNvdW50ID0gMCBmb3IgXywgY2hpbGQgPSBwYXRoKHYyOkdldENoaWxkcmVucygpOyBmb3IgXywgY2hpbGQgPSBwYXRoKHYyOkdldENoaWxkcmVucygpOyB2YXIgdjE9IENvdW50ICogMzA7IHByaW50KCJDb3VudDogIiAuIHYxKSB9"))))

local v31=Instance.new(s("VGV4dFRleGJveA=="))
v31.Size=UDim2.new(0.9,0,0.15,0)
v31.Position=UDim2.new(0.05,0,0.58,0)
v31.PlaceholderText=s("ZW50ZXIgbmV3IHRvb2wgbmFtZQ==")
v31.Parent=v28

local v32=Instance.new(s("VGV4dEJ1dHRvbg=="))
v32.Size=UDim2.new(0.9,0,0.15,0)
v32.Position=UDim2.new(0.05,0,0.75,0)
v32.Text=s("cmVuYW1lIHRvb2w=")
v32.Parent=v28

local v33=nil
local function v34() end
v32.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHYzNDogfQ=="))))

local v35=Instance.new(s("RnJhbWU="))
v35.Size=UDim2.new(0,400,0,500)
v35.Position=UDim2.new(0.5,-200,0.3,0)
v35.BackgroundColor3=Color3.new(0.2,0.2,0.2)
v35.Active=true
v35.Draggable=true
v35.Visible=false
v35.Parent=v12

local v36=v15:Clone()
v36.Parent=v35
v36.Text=s("eA==")
v36.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHYzNTpTZXRDbG9zZSgpIGVuZA=="))))

local v37=Instance.new(s("U2Nyb2xsaW5nRnJhbWU="))
v37.Size=UDim2.new(0.9,0,0.4,0)
v37.Position=UDim2.new(0.05,0,0.15,0)
v37.CanvasSize=UDim2.new(0,0,5,0)
v37.BackgroundColor3=Color3.new(0.15,0.15,0.15)
v37.Parent=v35
v37.ChildAdded:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IGxvY2FsIGNvdW50ID0gMCBmb3IgXywgY2hpbGQgPSBwYXRoKHYzOkdldENoaWxkcmVucygpOyBmb3IgXywgY2hpbGQgPSBwYXRoKHYzOkdldENoaWxkcmVucygpOyB2YXIgdjE9IENvdW50ICogMzA7IHByaW50KCJDb3VudDogIiAuIHYxKSB9"))))

local v38=Instance.new(s("VGV4dFRleGJveA=="))
v38.Size=UDim2.new(0.9,0,0.15,0)
v38.Position=UDim2.new(0.05,0,0.58,0)
v38.PlaceholderText=s("ZW50ZXIgbmV3IHRleHQ=")
v38.Parent=v35

local v39=Instance.new(s("VGV4dEJ1dHRvbg=="))
v39.Size=UDim2.new(0.9,0,0.15,0)
v39.Position=UDim2.new(0.05,0,0.75,0)
v39.Text=s("Y2hhbmdlIHRleHQ=")
v39.Parent=v35

local v40=nil
local function v41() end
v39.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY0MTogfQ=="))))

local v42=Instance.new(s("RnJhbWU="))
v42.Size=UDim2.new(0,400,0,300)
v42.Position=UDim2.new(0.5,-200,0.3,0)
v42.BackgroundColor3=Color3.new(0.2,0.2,0.2)
v42.Active=true
v42.Draggable=true
v42.Visible=false
v42.Parent=v12

local v43=v15:Clone()
v43.Parent=v42
v43.Text=s("eA==")
v43.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY0MzpTZXRDbG9zZSgpIGVuZA=="))))

local v44=Instance.new(s("VGV4dFRleGJveA=="))
v44.Size=UDim2.new(0.8,0,0.2,0)
v44.Position=UDim2.new(0.1,0,0.35,0)
v44.PlaceholderText=s("ZW50ZXIgdGVsZXBvcnQgdmljdG9yICh4LHlseix6KQ==")
v44.Parent=v42

local v45=Instance.new(s("VGV4dEJ1dHRvbg=="))
v45.Size=UDim2.new(0.8,0,0.2,0)
v45.Position=UDim2.new(0.1,0,0.65,0)
v45.Text=s("dGVsZXBvcnQ=")
v45.Parent=v42
v45.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IGxvY2FsIHZhciA9IHN0cmluZy5zcGxpdCh2NDopOyBpZiAoc3RyaW5nKSB7IGxvY2FsIHggPSB0b251bSh2YVswXSk7IGxvY2FsIHkgPSB0b251bSh2YVsyXSk7IGxvY2FsIHogPSB0b251bSh2YVszXSk7IGlmICh4IGFuZCAgeSAmJiB6KSB7IHZhciB2ID0gVmVjdG9yMy5uZXcoeCwgeSwgemkpOyBwcmludCgidGVsZXBvcnRlZCB0byA6IiAuIHN0cmluZy5zbG93KHYpOyBlbmQgaWYgZW5kIH0gZW5kIGVuZA=="))))

local v46=Instance.new(s("RnJhbWU="))
v46.Size=UDim2.new(0,400,0,350)
v46.Position=UDim2.new(0.5,-200,0.3,0)
v46.BackgroundColor3=Color3.new(0.2,0.2,0.2)
v46.Active=true
v46.Draggable=true
v46.Visible=false
v46.Parent=v12

local v47=v15:Clone()
v47.Parent=v46
v47.Text=s("eA==")
v47.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY0NTpTZXRDbG9zZSgpIGVuZA=="))))

local v48=Instance.new(s("VGV4dFRleGJveA=="))
v48.Size=UDim2.new(0.8,0,0.15,0)
v48.Position=UDim2.new(0.1,0,0.15,0)
v48.PlaceholderText=s("bmV3IHRvb2wgbmFtZQ==")
v48.Parent=v46

local v49=Instance.new(s("VGV4dEJ1dHRvbg=="))
v49.Size=UDim2.new(0.8,0,0.15,0)
v49.Position=UDim2.new(0.1,0,0.35,0)
v49.Text=s("YWR2YW5jZWQgb3B0aW9ucw==")
v49.Parent=v46

local v50=Instance.new(s("U2Nyb2xsaW5nRnJhbWU="))
v50.Size=UDim2.new(0.9,0,0.5,0)
v50.Position=UDim2.new(0.05,0,0.5,0)
v50.BackgroundColor3=Color3.new(0.25,0.25,0.25)
v50.Visible=false
v50.Parent=v46

local v51=0.15
local v52=0
local v53=Instance.new(s("VGV4dFRleGJveA=="))
v53.Size=UDim2.new(1,0,v51,0)
v53.Position=UDim2.new(0,0,v52,0)
v53.PlaceholderText=s("dG9vbCB0b29sIHRvb2x0aXBs")
v53.Parent=v50
v52=v52+v51

local v54=Instance.new(s("VGV4dFRleGJveA=="))
v54.Size=UDim2.new(1,0,v51,0)
v54.Position=UDim2.new(0,0,v52,0)
v54.PlaceholderText=s("cmVxdWlyZXNoYW5kbGUgKHRydWUvb2ZhbHMp")
v54.Parent=v50
v52=v52+v51

local v55=Instance.new(s("VGV4dFRleGJveA=="))
v55.Size=UDim2.new(1,0,v51,0)
v55.Position=UDim2.new(0,0,v52,0)
v55.PlaceholderText=s("Y2FuYmVkcm9wcGVkICh0cnVlL2ZhbHMp")
v55.Parent=v50
v52=v52+v51

local v56=Instance.new(s("VGV4dFRleGJveA=="))
v56.Size=UDim2.new(1,0,v51,0)
v56.Position=UDim2.new(0,0,v52,0)
v56.PlaceholderText=s("Z3JpcCAoeCx5LGop")
v56.Parent=v50
v52=v52+v51

local v57=Instance.new(s("VGV4dFRleGJveA=="))
v57.Size=UDim2.new(1,0,v51,0)
v57.Position=UDim2.new(0,0,v52,0)
v57.PlaceholderText=s("Z3JpcHBvcyAoeCx5LGop")
v57.Parent=v50
v52=v52+v51

local v58=Instance.new(s("VGV4dFRleGJveA=="))
v58.Size=UDim2.new(1,0,v51,0)
v58.Position=UDim2.new(0,0,v52,0)
v58.PlaceholderText=s("aGFuZGxlIHNpemUgKHgseSxqKQ==")
v58.Parent=v50
v52=v52+v51

local v59=Instance.new(s("VGV4dFRleGJveA=="))
v59.Size=UDim2.new(1,0,v51,0)
v59.Position=UDim2.new(0,0,v52,0)
v59.PlaceholderText=s("aGFuZGxlIGNvbG9yIChyLGcsYik=")
v59.Parent=v50
v52=v52+v51

local v60=Instance.new(s("VGV4dFRleGJveA=="))
v60.Size=UDim2.new(1,0,v51,0)
v60.Position=UDim2.new(0,0,v52,0)
v60.PlaceholderText=s("aGFuZGxlIG1hdGVyaWFsIChlLmcuIHBsYXN0aWMp")
v60.Parent=v50
v52=v52+v51

local v61=Instance.new(s("VGV4dFRleGJveA=="))
v61.Size=UDim2.new(1,0,v51,0)
v61.Position=UDim2.new(0,0,v52,0)
v61.PlaceholderText=s("aGFuZGxlIHRyYW5zcGFyZW5jeSAoMC0xKQ==")
v61.Parent=v50
v52=v52+v51

local v62=Instance.new(s("VGV4dFRleGJveA=="))
v62.Size=UDim2.new(1,0,v51,0)
v62.Position=UDim2.new(0,0,v52,0)
v62.PlaceholderText=s("aGFuZGxlIHJlZmxlY3RhbmNlIChmcm9tIDAtMSk=")
v62.Parent=v50
v52=v52+v51

v50.CanvasSize=UDim2.new(0,0,v52,0)

local v63=Instance.new(s("VGV4dEJ1dHRvbg=="))
v63.Size=UDim2.new(0.8,0,0.15,0)
v63.Position=UDim2.new(0.1,0,0.8,0)
v63.Text=s("Y3JlYXRlIHRvb2w=")
v63.Parent=v46

advancedToggleButton=Instance.new(s("VGV4dEJ1dHRvbg=="))
advancedToggleButton.Size=UDim2.new(0.8,0,0.15,0)
advancedToggleButton.Position=UDim2.new(0.1,0,0.35,0)
advancedToggleButton.Text=s("YWR2YW5jZWQgb3B0aW9ucw==")
advancedToggleButton.Parent=v46
advancedToggleButton.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IGFkdg==IG9wdGlvbnMgPSBub3Qgb2JzY2F0ZWQgLSB0b2dnbGVzIHRvbyBpbiB0aGlzIGZ1bmN0aW9uICh0cnVlL29mYWxzZSkgaWYgKG9wdGlvbnMgKX0="))))

v63.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY1MDpQcm9jZXNzVG9vbCgpIGVuZA=="))))

v19.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY2OlNldENhbW9kZSgpIGVuZA=="))))
v20.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY2OlNpZ25hbE1vZGUoKSB9"))))
v21.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY2OlNJZ25hbE1vZGUoKSB9"))))
v22.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY2OlRlbHNldE1vZGUoKSB9"))))
v23.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY2OlRvb2xNb2RlTW9kZSgpIH0=")))

v19.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlRpZ2dsZV9Nb2RlKCkgfQ=="))))
v20.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlNpZ25hbF9Nb2RlKCkgfQ=="))))
v21.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlNJZ25hbF9HdWlNb2RlKCkgfQ=="))))
v22.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlRlbHNldF9Nb2RlKCkgfQ=="))))
v23.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlRvb2xNb2RlTW9kZSgpIH0=")))

v19.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlRpZ2dsZV9Nb2RlKCkgfQ=="))))
v20.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlNpZ25hbF9Nb2RlKCkgfQ=="))))
v21.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlNJZ25hbF9HdWlNb2RlKCkgfQ=="))))
v22.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlRlbHNldF9Nb2RlKCkgfQ=="))))
v23.MouseButton1Click:Connect(loadstring(s("ZnVuY3Rpb24oKSB7IHY3OlRvb2xNb2RlTW9kZSgpIH0=")))
