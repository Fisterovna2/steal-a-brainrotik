local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local function tryFire(remote, ...)
    local args = {...}
    local ok, result = pcall(function()
        remote:FireServer(unpack(args))
    end)
    if ok then
        warn("[+] Успех Remote:", remote:GetFullName(), "Args:", table.concat(args, ", "))
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

print("✅ Чистый Brute Remote запущен. Никакой передачи данных, только локальный лог.")
