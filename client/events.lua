RegisterNetEvent('id_selldrugs:alertCop', function(alert, coords)
    Core.Utils:ShowNotification(alert)
    local Blip = AddBlipForCoord(coords)
    SetBlipSprite(Blip,  10)
    SetBlipColour(Blip,  1)
    SetBlipScale(Blip, 0.8)
    SetBlipAlpha(Blip, 255)
    SetBlipAsShortRange(Blip,  false)


    Citizen.Wait(Config.BlipTime * 1000)
    RemoveBlip(Blip)
end)

AddEventHandler('id_selldrugs:addBlacklistedPed', function(ped)
    table.insert(blasklistedPeds, ped)
end)