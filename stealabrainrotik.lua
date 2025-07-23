local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Brainrot Spawner | Clean Version",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "BrainrotSpawnerCFG"
})

OrionLib:MakeNotification({
    Name = "Brainrot Spawner",
    Content = "Чистый брут запущен | Без Webhook",
    Image = "rbxassetid://4483345998",
    Time = 5
})

local BruteTab = Window:MakeTab({
    Name = "Spawner",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AutoBrute = false

local function BruteRemote()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")

    local function tryFire(remote, ...)
        local args = {...}
        local ok, result = pcall(function()
            remote:FireServer(unpack(args))
        end)
        if ok then
            print("[+] Успех Remote:", remote:GetFullName(), "Args:", table.concat(args, ", "))
        else
            print("[-] Ошибка Remote:", remote:GetFullName(), "Error:", result)
        end
    end

    for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") then
            print("[INFO] Найден Remote:", remote:GetFullName())
            tryFire(remote)
            tryFire(remote, "Brainrot")
            tryFire(remote, "Brainrot", true)
            tryFire(remote, "Brainrot", 1, true, 999)
        end
    end

    for _, remote in pairs(Workspace:GetDescendants()) do
        if remote:IsA("RemoteEvent") then
            print("[INFO] Найден Remote:", remote:GetFullName())
            tryFire(remote)
            tryFire(remote, "Brainrot")
            tryFire(remote, "Brainrot", true)
            tryFire(remote, "Brainrot", 1, true, 999)
        end
    end
end

BruteTab:AddButton({
    Name = "Start Brute Force",
    Callback = function()
        BruteRemote()
    end
})

BruteTab:AddToggle({
    Name = "Auto Brute (loop)",
    Default = false,
    Callback = function(Value)
        AutoBrute = Value
        if AutoBrute then
            while AutoBrute do
                BruteRemote()
                task.wait(10)
            end
        end
    end
})

OrionLib:Init()
