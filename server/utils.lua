Utils = Utils or {}

function Utils:GetInventoryItem(src, itemName)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)

        return xPlayer.getInventoryItem(itemName)
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)
        local invItem = ply.Functions.GetItemByName(itemName)

        if not invItem then return nil end
    
        return {
            name = invItem.name,
            label = invItem.label,
            count = invItem.amount
        }
    else
        Core.Utils:Print('nil-func', 'Utils:GetInventoryItem')
        --[[
            Funktionen skal return et table der indeholder:
                label = 'itemLabel',
                name = 'itemName',
                count = 1
        ]]
        return {label = 'a', name = 'a', count = 0}
    end
end

function Utils:GetItemLabel(itemName)
    if _FRAMEWORK == 'ESX' then
        return ESX.GetItemLabel(itemName)
    elseif _FRAMEWORK == 'QBCORE' then
        return QBCore.Shared.Items[itemName].label
    else
        Core.Utils:Print('nil-func', 'Utils:GetItemLabel')
        --[[
            Funktionen skal return itemLabel på item
        ]]
        return 'none'
    end
end

function Utils:GetOnlineCops()
    if _FRAMEWORK == 'ESX' then
        local cops = 0

        for k,v in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(v)

            if xPlayer.job.name == 'police' then
                cops = cops + 1
            end
        end

        return cops
    elseif _FRAMEWORK == 'QBCORE' then
        local cops = 0

        for k,ply in pairs(QBCore.Functions.GetQBPlayers()) do
            if ply.PlayerData.job.name == 'police' then
                cops = cops + 1
            end
        end

        return cops
    else
        Core.Utils:Print('nil-func', 'Utils:GetOnlineCops')
        --[[
            Funktionen skal return antallet af betjente online
        ]]
        return 0
    end
end

function Utils:RemoveInventoryItem(src, itemName, count)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)

        xPlayer.removeInventoryItem(itemName, count)
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)

        ply.Functions.RemoveItem(itemName, count)
    else
        Core.Utils:Print('nil-func', 'Utils:RemoveInventoryItem')
        --[[
            Funktionen skal fjerne et item fra spilleren inventory
        ]]
    end
end

function Utils:AddMoney(src, amount)
    if _FRAMEWORK == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)

        xPlayer.addAccountMoney('black_money', amount)
    elseif _FRAMEWORK == 'QBCORE' then
        local ply = QBCore.Functions.GetPlayer(src)

        ply.Functions.AddMoney('cash', amount)
    else
        Core.Utils:Print('nil-func', 'Utils:AddMoney')
        --[[
            Funktionen skal tilføje penge til personen.
        ]]
    end
end

function Utils:GetGangName(src)
    if Config.UsingGangSystem then
        local gang = exports['id_gangsystem']:getPlayerGang(src)

        if gang then
            return gang.name
        end

        return nil
    else
        Core.Utils:Print('nil-func', 'Utils:GetGangName')
        --[[
            Funktionen skal return navnet på spilleren bande
        ]]
        return 'none'
    end
end

function Utils:GetAllPlayers()
    if _FRAMEWORK == 'ESX' then
        local RT = {}

        for k,v in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(v)

            table.insert(RT, {
                job = xPlayer.job.name,
                src = v
            })
        end

        return RT
    elseif _FRAMEWORK == 'QBCORE' then
        local RT = {}

        for k,ply in pairs(QBCore.Functions.GetQBPlayers()) do
            table.insert(RT, {
                job = ply.PlayerData.job.name,
                src = ply.PlayerData.source
            })
        end
    else
        Core.Utils:Print('nil-func', 'Utils:GetAllPlayers')
        --[[
            Funktionen skal return et table med alle spillere, som har et table med deres spillerData:
                Player1 = {job = 'jobName', src = 1},
                Player2 = {job = 'jobName', src = 2}
        ]]
        local RETURN = {}

        for k,v in pairs(GetPlayers()) do
            table.insert(RETURN, {
                job = 'none',
                src = v
            })
        end

        return RETURN
    end
end