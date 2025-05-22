-- [Key UI для Roblox Executor]
-- GUI на основе Drawing API или внутрення функц. GUI библиотеки экзекутора

local correctKey = "OWNER-3740054f89a4d5dde64c4d0f88d1c085"

local function showMainMenu()
    print("Добро пожаловать! У вас есть доступ.")
    print("[1] Нажмите для запуска скрипта")

    -- Пример скрипта (можно заменить на расшифрованный или загрузку с сайта)
    if writefile then
        writefile("my_exec.txt", "Executed at " .. os.date())
    end

    loadstring("print('Скрипт успешно выполнен!')")()
end

local function getKey()
    setclipboard("https://example.com/getkey") -- замените на свой URL
    print("Ключ скопирован! Перейдите на сайт.")
end

local function checkKey(userKey)
    if userKey == correctKey then
        showMainMenu()
    else
        print("Неверный ключ!")
    end
end

-- Псевдо-GUI имитация
print("Введите ключ:")
local input = tostring(rconsoleread()) -- или другой способ получения ввода

if input == "getkey" then
    getKey()
else
    checkKey(input)
end
