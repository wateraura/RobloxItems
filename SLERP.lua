function inverseC3(C3)
	return Color3.new(1 - C3.r, 1 - C3.g, 1 - C3.b) 
end

function slerp(a, b, t) --Spherical interpolation (SLERP)
	local function C3V3(C3)
		return Vector3.new(C3.r,C3.g,C3.b)
	end
	local a = C3V3(a)
	local b = C3V3(b)
	local dot = a:Dot(b)
	if math.abs(dot) >= 1 then
		wait()
		slerp(a,b,t)
	else
		local r = math.acos(dot)*t
		local v = (a*math.sin((1 - t)*r) + b*math.sin(t*r)) / math.sin(r)
		return Color3.new(v.X,v.Y,v.Z)
	end
end

function C3V3(C3)
	return Vector3.new(C3.r,C3.g,C3.b)
end

for f = 1,1000 do
	f=f/1000
workspace.X.PointLight.Color = slerp(Color3.new(1,0,0),Color3.new(0,0,1),f)
print("SLERP "..(f*1000)..":",C3V3(workspace.X.PointLight.Color).z*255)
workspace.X.BillboardGui.TextLabel.TextColor3 = inverseC3(workspace.X.PointLight.Color)
wait()
end
for f = 1,1000 do
	f=f/1000
workspace.X.PointLight.Color = slerp(Color3.new(0,0,1),Color3.new(1,0,0),f)
print("SLERP "..(f*1000)..":",C3V3(workspace.X.PointLight.Color).z*255)
workspace.X.BillboardGui.TextLabel.TextColor3 = inverseC3(workspace.X.PointLight.Color)
wait()
end

