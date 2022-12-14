Config = {}


Config.Framework = "QBCore" -- ESX || QBCore || "other"

Config.CoreFolderName = "qb-core" -- es_extended || qb-core

Config.Triggers = {
    ["getObject"] = "QBCore:GetObject", -- || "esx:getSharedObject" || "QBCore:GetObject"
}

Config.Staff = {
    "god", "admin", "superadmin"
}

Config.RestrictMode = false --set to to true if you want to restrict people from using any images and use only the images from Allowed Discord Channels, if false users can use any link for images

--[[
    Just add as many channels you want if you set RestrictMode to true
]]--
Config.AllowedChannels = { --Allowed Discord channels for PNG upload
    "https://cdn.discordapp.com/attachments/909905066671108136",  -- the number after "attachments/" is the channel id, to get that, just right click on the channel and copy id (for now this is the teasers channel on my discord)
    -- "https://cdn.discordapp.com/attachments/909905066671108136",  

}

