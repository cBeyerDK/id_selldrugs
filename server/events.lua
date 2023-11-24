local AC = exports['id_core']:getACUtils()
local playerLoadEvent = 'id_core:playerLoaded'
if Core.Settings.Framework.Name == 'ESX' then playerLoadEvent = 'esx:playerLoaded' end
--[[
    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end
]]

RegisterNetEvent('id_selldrugs:sellDrugs', function(zoneName, eventCode)
    local src = source

    if eventCode ~= serverEventCode then
        AC:PermBan(src, nil, 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    local sellAmount, drugName, drugAmount, drugPrice, sellPrice, copMultiplier

    for k,v in pairs(Config.Drugs) do
        if Utils:GetInventoryItem(src, v.item) and Utils:GetInventoryItem(src, v.item).count > 0 then
            drugName = v.item
            drugAmount = Utils:GetInventoryItem(src, v.item).count
            drugPrice = v.price
            copMultiplier = v.copMultiplier

            break
        end
    end

    if Config.MaxSellAmount == -1 then
        sellAmount = drugAmount
    else
        math.randomseed(os.time())
        for i=Config.MaxSellAmount, 1, -1 do
            if drugAmount >= i then
                sellAmount = math.random(math.floor(i/10), i)
                break
            end
        end
    end

    if sellAmount and sellAmount > 0 then
        local cops = Utils:GetOnlineCops()
        if cops > 0 then
            copMultiplier = copMultiplier * (cops > Config.MaxCops and Config.MaxCops or cops)
        end

        sellPrice = Core.Utils.Math:Round(sellAmount * drugPrice * copMultiplier)

        Utils:RemoveInventoryItem(src, drugName, sellAmount)
        Utils:AddMoney(src, sellPrice)

        TriggerClientEvent('id_notify:notify', src, {
            message = _U('sold_drugs', sellAmount, Utils:GetItemLabel(drugName), Core.Utils.Math:GroupDigits(sellPrice)),
            type = 'success',
        })

        if Config.UsingZoneSystem then
            local gangName = Utils:GetGangName(src)

            if not gangName then return end

            TriggerEvent('id_zonesystem:zones:soldDrugs', gangName, zoneName, src)

            if not exports['id_zonesystem']:getZoneOwner(zoneName) then return end

            if gangName and exports['id_zonesystem']:getZoneOwner(zoneName) == gangName then
                local bonus = exports['id_zonesystem']:getZoneSellBonus(gangName, zoneName, sellPrice)
                if not bonus then return end

                Utils:AddMoney(src, bonus)

                TriggerClientEvent('id_notify:notify', src, {
                    message = _U('bonus_zone', Core.Utils.Math:GroupDigits(bonus), exports['id_zonesystem']:GetZoneLabel(zoneName)),
                    type = 'custom',
                    icon = 'fas fa-hand-holding-usd'
                })
            end
        end
    end

end)

RegisterNetEvent('id_selldrugs:AlertCops', function(street1, s2, street2)
    local src = source
    local srcPed = GetPlayerPed(src)
    local srcCoords = GetEntityCoords(srcPed)

    local msg = _U('alert_cops', street1)
    if s2 > 0 then msg = _U('alert_cops_2', street1, street2) end

    for k,v in pairs(Utils:GetAllPlayers()) do
        if v.job == 'police' then
            TriggerClientEvent('id_selldrugs:alertCop', v.src, msg, srcCoords)
        end
    end
end)
