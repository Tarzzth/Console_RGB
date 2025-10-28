# 🌈 RGBConsole.lua

โมดูล Lua สำหรับ Roblox ที่ทำให้ **DevConsole ของคุณมีเอฟเฟกต์สี RGB สมูท ๆ** แบบไล่เฉดอย่างสวยงาม  
ใช้งานง่าย เป็นมิตรกับเฟรมเรต และสามารถเปิด/ปิดการทำงานได้ทุกเมื่อ

---

## ✨ ฟีเจอร์

- 🔥 ไล่สี RGB แบบ Smooth Transition ด้วยฟังก์ชัน Sine Wave
- 💬 รองรับข้อความที่คุณพิมพ์ผ่าน `:Print()`
- ♻️ ทำงานแบบ Real-time โดยใช้ `RenderStepped`
- 🧩 ออกแบบในรูปแบบ Module ใช้งานได้ง่ายในทุกโปรเจกต์
- 🧱 ปลอดภัย และใช้งานง่าย

---

## 📦 วิธีติดตั้ง

1. loadstring ไฟล์ mainLibarary.lua:
2. ใช้งานตามฟังชั่น

```lua
local RGBConsole = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tarzzth/Console_RGB/refs/heads/main/mainLibarary.lua"))()

RGBConsole:Print("RGBConsole Loaded!")
RGBConsole:Start()
```
Thanks 
