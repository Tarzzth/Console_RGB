# 🌈 RGBConsole.lua

โมดูล Lua สำหรับ Roblox ที่ทำให้ **DevConsole ของคุณมีเอฟเฟกต์สี RGB สมูท ๆ** แบบไล่เฉดอย่างสวยงาม  
ใช้งานง่าย เป็นมิตรกับเฟรมเรต และสามารถเปิด/ปิดการทำงานได้ทุกเมื่อ

---

## ✨ ฟีเจอร์

- 🔥 ไล่สี RGB แบบ Smooth Transition ด้วยฟังก์ชัน Sine Wave
- 💬 รองรับข้อความที่คุณพิมพ์ผ่าน `:Print()`
- ♻️ ทำงานแบบ Real-time โดยใช้ `RenderStepped`
- 🧩 ออกแบบในรูปแบบ Module ใช้งานได้ง่ายในทุกโปรเจกต์
- 🧱 ปลอดภัยจาก Error แม้ไม่พบ DevConsole ในบางกรณี

---

## 📦 วิธีติดตั้ง

1. สร้างไฟล์ใหม่ชื่อ **`RGBConsole.lua`**
2. วางโค้ดต่อไปนี้ลงไปในไฟล์:

```lua
-- RGBConsole.lua
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

	print("[RGBConsole] ✅ RGB Started!")
end

function RGBConsole:Stop()
	if Connections["RGBLoop"] then
		Connections["RGBLoop"]:Disconnect()
		Connections["RGBLoop"] = nil
		print("[RGBConsole] ⏹️ RGB Stopped.")
	end
end

return RGBConsole
