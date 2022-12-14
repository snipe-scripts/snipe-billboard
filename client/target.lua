

Citizen.CreateThread(function()

    if Config.Framework == "QBCore" then
        RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
            TriggerServerEvent("snipe-billboard:server:triggerActiveTexture")
        end)
    elseif Config.Framework == "ESX" then
        RegisterNetEvent("esx:playerLoaded", function()
            TriggerServerEvent("snipe-billboard:server:triggerActiveTexture")
        end)
    elseif Config.Framework == "other" then -- custom framework (add event for playerloaded and trigger the server event)

    else
        print("snipe-billboard: Framework not supported, check config")
    end

end)