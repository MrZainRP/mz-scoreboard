local QBCore = exports['qb-core']:GetCoreObject()

local minPacific     = Config.minBanks
local minPaleto      = Config.minVangellico
local minShopRobbery = Config.minShopRobbery
local minVangellico  = Config.CornerSelling
local minHostage     = Config.HouseRobberies
local bool = false
local copCount = 0

RegisterNetEvent("police:SetCopCount", function(count)
    copCount = count
end)

RegisterCommand("Scoreboard", function()
    if not bool then 
        SetNuiFocus(true, true)  
        local my_id = GetPlayerServerId(PlayerId())
            QBCore.Functions.TriggerCallback("scoreboard:GetPlayers", function(players)
            local plist = {}
            for k, player in ipairs(players) do
                local p_name = player.name
                local p_charName = player.charName
                local p_id = player.id
                if p_id == my_id then
                    table.insert(plist, '<div id=\"myplayer\"> #' .. p_id .. ' | ' .. p_name .. '<span id=\"tiptext\"><i class=\"fas fa-file-signature\"></i>' .. p_charName .. '<br><i class=\"fas fa-id-card\"></i> ' .. p_id .. '</div>')
                else
                    table.insert(plist, '<div id=\"bplayers\"> #' .. p_id .. ' | ' .. p_name .. '<span id=\"tiptext\"><i class=\"fas fa-file-signature\"></i>' .. p_charName .. '<br><i class=\"fas fa-id-card\"></i> ' .. p_id .. '</div>')
                end
            end     
            if copCount >= minPacific then pacific = true else pacific = false end
            if copCount >= minPaleto then paleto = true else paleto = false end
            if copCount >= minShopRobbery then shop = true else shop = false end
            if copCount >= minVangellico then jewels = true else jewels = false end
            if copCount >= minHostage then hostage = true else hostage = false end
            SendNUIMessage({ 
                action = "updateScoreboard",
                info = table.concat(plist),
                pacific = pacific,
                paleto = paleto,
                shop = shop,
                jewels = jewels,
                hostage = hostage
            })
        end)
        bool = true
    end
end)

RegisterKeyMapping("Scoreboard", "Open Scoreboard", "keyboard", Config.KeyTrigger)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    bool = false
end)
