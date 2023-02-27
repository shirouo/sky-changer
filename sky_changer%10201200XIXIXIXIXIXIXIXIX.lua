local sky = game.Lighting
for _, child in ipairs(sky:GetChildren()) do
if child:IsA("Sky") then
child:Destroy()
end
end

local sky = game.Lighting
for _, child in ipairs(sky:GetChildren()) do
if child:IsA("Atmosphere") then
child:Destroy()
end
end

local sky = game.Lighting
for _, child in ipairs(sky:GetChildren()) do
if child:IsA("Bloom") then
child:Destroy()
end
end

local sky = game.Lighting
for _, child in ipairs(sky:GetChildren()) do
if child:IsA("SunRaysEffect") then
child:Destroy()
end
end


game.Lighting.Ambient = Color3.fromRGB(0,0,0)
game.Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
game.Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
game.Lighting.OutdoorAmbient = Color3.fromRGB(152,152,146)
game.Lighting.Brightness = 2
game.Lighting.ShadowSoftness = 0.2
game.Lighting.GlobalShadows = true
game.Lighting.FogStart = 0
game.Lighting.FogEnd = 500
game.Lighting.FogColor = Color3.fromRGB(122,122,121)


getgenv().Time = true


spawn(function()
while wait() do
if not getgenv().Time then break end
if getgenv().Time then
game.Lighting.ClockTime = 17.2
wait(10)
end
end
end)


getgenv().Lights = true


spawn(function()
local light = game:GetService("Workspace").Lights
while wait() do
if not getgenv().Lights then break end
if getgenv().Lights then
	for _, child in ipairs(light:GetDescendants()) do
		if child:IsA("SpotLight")then
			child.Color = Color3.fromRGB(98,110,127)
			child.Enabled = true
		end
	end
	wait(0.5)
	for _, child in ipairs(light:GetDescendants()) do
		if child:IsA("SpotLight")then
			child.Color = Color3.fromRGB(98,110,127)
			child.Enabled = true
		end
	end
	wait(0.5)
end
end
end)

wait(10)
        function isframework(scriptInstance)
    if tostring(scriptInstance) == "Framework" then
        return true
    end
    return false
end

function checkArgs(instance,index)
    if tostring(instance):lower():find("camera") and tostring(index) == "CFrame" then
        return true
    end
    return false
end

newindex = hookmetamethod(game, "__newindex", function(self,index,value)
    local callingScr = getcallingscript()

    if isframework(callingScr) and checkArgs(self,index) then
       return;
    end

    return newindex(self,index,value)
end)
