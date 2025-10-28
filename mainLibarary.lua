
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local RGBConsole = {}
local LogCache = {}
local Connections = {}

local function rainbowColor(t)
	local r = math.sin(t) * 127 + 128
	local g = math.sin(t + 2) * 127 + 128
	local b = math.sin(t + 4) * 127 + 128
	return Color3.fromRGB(r, g, b)
end


local function safeFind(...)
	local current = CoreGui
	for _, name in ipairs({...}) do
		current = current:FindFirstChild(name)
		if not current then return nil end
	end
	return current
end


local ClientLog = safeFind("DevConsoleMaster", "DevConsoleWindow", "DevConsoleUI", "MainView", "ClientLog")

if not ClientLog then
	warn("[RGBConsole] ❌ ไม่พบ DevConsole ใน CoreGui")
	return RGBConsole
end


function RGBConsole:Print(text)
	local str = tostring(text)
	print(str)
	table.insert(LogCache, str)
end

function RGBConsole:Start()
	if Connections["RGBLoop"] then return end

	local tickTime = 0
	Connections["RGBLoop"] = RunService.RenderStepped:Connect(function(dt)
		tickTime += dt * 2

		if #LogCache == 0 then return end

		for _, label in ipairs(ClientLog:GetDescendants()) do
			if label:IsA("TextLabel") then
				for _, log in ipairs(LogCache) do
					if label.Text:lower():find(log:lower()) then
						label.TextColor3 = rainbowColor(tickTime)
					end
				end
			end
		end
	end)

	print("[RGBConsole] ✅ ระบบ RGB ทำงานแล้ว!")
end

function RGBConsole:Stop()
	if Connections["RGBLoop"] then
		Connections["RGBLoop"]:Disconnect()
		Connections["RGBLoop"] = nil
		print("[RGBConsole] ⏹️ หยุดการทำงานของ RGB แล้ว")
	end
end

return RGBConsole

