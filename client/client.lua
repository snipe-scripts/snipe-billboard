duiObjbillboard = nil

RegisterNetEvent("snipe-billboard:client:OpenUI")
AddEventHandler("snipe-billboard:client:OpenUI", function(room)
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('CloseDocument', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('Invalid', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('PrintDocument', function(data)
    SetNuiFocus(false, false)
    local url = data.url
    local width = data.width
    local height = data.height

    if Config.RestrictMode then
        local match = false 
        for k, v in pairs(Config.AllowedChannels) do 
            if string.find(data.url, v) ~= nil then
                match = true
                break
            end 
        end
        if not match then
            return
        end
    end
    RemoveReplaceTexture("rojo_trinity_billboard", "rojo_trinity_billboard")
    if duiObjbillboard then
        DestroyDui(duiObjbillboard)
    end
    TriggerServerEvent("snipe-billboard:server:synctextures", "test", url, width, height)
end)

RegisterNetEvent("snipe-billboard:client:synctextures")
AddEventHandler("snipe-billboard:client:synctextures", function(room, url, width, height)
    local txd = CreateRuntimeTxd('pizzeria_menu_txd')
    duiObjbillboard = CreateDui(url, width, height)
    local dui = GetDuiHandle(duiObjbillboard)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, "doc_png", dui)
    AddReplaceTexture('rojo_trinity_billboard', 'rojo_trinity_billboard', 'pizzeria_menu_txd', "doc_png")
end)


RegisterNetEvent("snipe-billboard:client:removeDUI")
AddEventHandler("snipe-billboard:client:removeDUI", function(room)
    TriggerServerEvent("snipe-billboard:server:removeTextures", room)
end)

RegisterNetEvent("snipe-billboard:client:removeTextures")
AddEventHandler("snipe-billboard:client:removeTextures", function(room)
    DestroySpawnedDui(room)
end)

function DestroySpawnedDui(room)
    if duiObjbillboard then
        DestroyDui(duiObjbillboard)
        duiObjbillboard = nil
        RemoveReplaceTexture("rojo_trinity_billboard", "rojo_trinity_billboard")
    end
end

function GetDui()
    TriggerServerEvent("snipe-billboard:server:triggerActiveTexture")
end

-- events for bt-target

RegisterNetEvent("snipe-billboard:client:OpenUIbillboard")
AddEventHandler("snipe-billboard:client:OpenUIbillboard", function()
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("snipe-billboard:client:removeDUIbillboard")
AddEventHandler("snipe-billboard:client:removeDUIbillboard", function()
    TriggerServerEvent("snipe-billboard:server:removeTextures", "test")
end)
