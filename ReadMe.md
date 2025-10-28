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
local RGBConsole = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourNameHere/RGBConsole/main/RGBConsole.lua"))()

RGBConsole:Print("RGBConsole Loaded!")
RGBConsole:Start()
```

return RGBConsole
