
if not getgenv().AutoRejoinConfig or not getgenv().AutoRejoinConfig["Enabled"] then return end

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- Lấy thời gian từ config và giới hạn từ 1 đến 9999 phút
local inputMinutes = tonumber(getgenv().AutoRejoinConfig["RejoinDelay"]) or 60
inputMinutes = math.clamp(inputMinutes, 1, 9999) -- Giới hạn hợp lệ

-- Đổi phút thành giây
local delayTime = inputMinutes * 60
local placeId = game.PlaceId

-- Đợi và thực hiện rejoin
task.delay(delayTime, function()
    if LocalPlayer then
        LocalPlayer:Kick("Auto Rejoin sau " .. inputMinutes .. " phút.")
    end
    TeleportService:Teleport(placeId, LocalPlayer)
end)
