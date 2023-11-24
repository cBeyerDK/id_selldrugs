Utils = Utils or {}

function Utils:IsModelBlacklisted(model)
    for i=1, #Config.BlacklistedModels, 1 do
        if GetHashKey(Config.BlacklistedModels[i]) == model then
            return true
        end
    end

    return false
end

function Utils:IsPedBlacklisted(ped)
    for i=1, #blasklistedPeds, 1 do
        if ped == blasklistedPeds[i] then
            return true
        end
    end

    return false
end

function Utils:CanSellToPed(ped)
    for k,v in pairs(lastPeds) do
        if v.ped == ped then
            return false
        end
    end

    return true
end

function Utils:AlertCops()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local s1, s2 = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local street1, street2 = GetStreetNameFromHashKey(s1), GetStreetNameFromHashKey(s2)

    TriggerServerEvent('id_selldrugs:AlertCops', street1, s2, street2)
end