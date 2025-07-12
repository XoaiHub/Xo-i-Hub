if not getgenv().AutoRejoinConfig or not getgenv().AutoRejoinConfig["Enabled"] then return end

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local placeId = game.PlaceId

-- Giới hạn thời gian từ 1 đến 9999 phút
local minutes = tonumber(getgenv().AutoRejoinConfig["RejoinDelay"]) or 60
minutes = math.clamp(minutes, 1, 9999)

local totalSeconds = minutes * 60
local startTime = os.time()

-- Sử dụng vòng lặp kiểm tra thời gian thay vì task.delay (chính xác hơn)
task.spawn(function()
    while true do
        task.wait(1)
        local elapsed = os.time() - startTime
        if elapsed >= totalSeconds then
            pcall(function()
                LocalPlayer:Kick("Auto Rejoin sau " .. minutes .. " phút.")
            end)
            task.wait(3)
            TeleportService:Teleport(placeId, LocalPlayer)
            break
        end
    end
end)
