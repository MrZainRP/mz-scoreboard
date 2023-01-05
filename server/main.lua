local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("scoreboard:GetPlayers", function(source, cb)
    local players = {}
    for k, player in pairs(QBCore.Functions.GetPlayers()) do
        Player = QBCore.Functions.GetPlayer(player)
        if Player ~= nil then
            local charinfo = Player.PlayerData.charinfo
            players[k] = {
                ["name"] = ("%s %s"):format(charinfo.firstname, charinfo.lastname),
                ["charName"] = ("%s %s"):format(charinfo.firstname, charinfo.lastname),
                ["id"] = player
            }
        end
    end
    cb(players)
end)
