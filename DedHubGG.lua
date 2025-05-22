-- DedHub Key System (Simple Version)

local correctKey = "OWNER-3740054f89a4d5dde64c4d0f88d1c085" -- твій ключ

function showMainMenu()
    print("✔ Access granted! Welcome to DedHub.")
    print("→ Executing script...")
    
    -- твій чит-код або будь-який скрипт нижче
    loadstring("print('💥 DedHub loaded successfully!')")()
end

function getKey()
    setclipboard("https://yourkeysite.com/getkey") -- заміни на свій сайт
    print("🔗 Link copied to clipboard! Visit the site to get your key.")
end

function checkKey(userKey)
    if userKey == correctKey then
        showMainMenu()
    else
        print("❌ Invalid key! Please try again.")
    end
end

-- Головне меню вводу
print("🔑 Enter your key or type 'getkey':")
local input = tostring(rconsoleread()) -- для Synapse/Xenny/Fluxus та інших

if input == "getkey" then
    getKey()
else
    checkKey(input)
end
