QBCore = nil
ESX = nil


RegisterCommand("testdui", function(source, args)
    if IsAuthorized(source) then
        TriggerClientEvent("snipe-billboard:client:OpenUIbillboard", source)
    end
end)

RegisterCommand("removedui", function(source, args)
    if IsAuthorized(source) then
        TriggerClientEvent("snipe-billboard:client:removeDUIbillboard", source)
    end
end)


CreateThread(function()
    if Config.Framework == "ESX" then
        TriggerEvent(Config.Triggers["getObject"], function(obj) ESX = obj end)
    elseif Config.Framework == "QBCore" then
        TriggerEvent(Config.Triggers["getObject"], function(obj) QBCore = obj end)
        if QBCore == nil then
            QBCore = exports[Config.CoreFolderName]:GetCoreObject()
        end
    end
end)

function IsAuthorized(source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = xPlayer.getGroup()
        for k, v in pairs(Config.Staff) do
            if v == perms then
                return true
            end
        end
        return false
    elseif Config.Framework == "QBCore" then
        local perms = QBCore.Functions.GetPermission(source)
        if type(perms) == "string" then
            for k, v in pairs(Config.Staff) do
                if v == perms then
                    return true
                end
            end
            return false
        elseif type(perms) == "table" then
            for k, v in pairs(Config.Staff) do
                if perms[v] then
                    return true
                else
                    return false
                end
            end
        end
    else
        --Add permissions check for standalone (by default its true)
        return true
    end
end