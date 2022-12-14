local ScreenInfo = {}

CreateThread(function()
    Wait(100)
    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), 'info.json'))
    ScreenInfo = LoadJson
    if ScreenInfo["test"] ~= nil then
        TriggerClientEvent("snipe-billboard:client:synctextures", -1, ScreenInfo["test"].room, ScreenInfo["test"].url, ScreenInfo["test"].width, ScreenInfo["test"].height)
    end
end)

local function StoreBillboardTable()
    SaveResourceFile(GetCurrentResourceName(), "info.json", json.encode(ScreenInfo), -1)
end

RegisterServerEvent("snipe-billboard:server:synctextures")
AddEventHandler("snipe-billboard:server:synctextures", function(room, url, width, height)
    local source = source
    local info = {}
    info.url = url
    info.width = width
    info.height = height
    info.room = room
    ScreenInfo[room] = info
    StoreBillboardTable()
    TriggerClientEvent("snipe-billboard:client:synctextures", -1, room, url, width, height)
end)

RegisterServerEvent("snipe-billboard:server:removeTextures")
AddEventHandler("snipe-billboard:server:removeTextures", function(room)
    ScreenInfo[room] = nil
    StoreBillboardTable()
    TriggerClientEvent("snipe-billboard:client:removeTextures", -1, room)
end)

RegisterServerEvent("snipe-billboard:server:triggerActiveTexture")
AddEventHandler("snipe-billboard:server:triggerActiveTexture", function()
    local source = source
    for k, v in pairs(ScreenInfo) do
        TriggerClientEvent("snipe-billboard:client:synctextures",source, k ,v.url, v.width, v.height)
    end
end)
