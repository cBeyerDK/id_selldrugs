serverEventCode = '3a3Hc5hvBHU$fqsS$m8XW=v4m#--6P2kCGpnPvrPKAnZkmC6CGSsXJmPZEmbTS37GQKLmz6Fm_V^LT3&#BdDvzdbj_vg*9VBUJ-G=afVLkKybB^-nWKe*H?!J!$4D--PW?tS^&529@uFsM_Z+aQ%=tr6aBav4pHz2vmKF&Y#JQ$PPM4sc7ku?QL=hg^T?_WkU?2-%#6Dh?5Y2__?SAgMX#3ktnR!8JaMXV76f2U-Ukz8@_k!u-X3xzBD!T6jD36_&&Agu@+gA$gsTL84!SVVdyEpQtWfKYkR_f&%@uUSPqnc2n5cuDB%MYhzzayVxbb*hxM&H8!!m_Q!wNVqS9Q9am*qg*&!B3Q=QmQQ5Chnw72A3+B@HeMEqA4+33a?Y4KXQ$-rk=Mtecgm^z9&C$uMw+*vmVD3P-jM7-2q$^nMBMcb+ab_Mvn?_m#X-6jnsfxn9%yDtC$T_TyR_t**2U4Dct+hxH#z_T5mR6a3_M*3$#S8Yvg*!Ph8g64w4pzFDk65P5Cu#HmTzLrKYw^97+4ykv4ZrKZ6%r^k677KU@*g^q7-M@HVTZbcv$+NdyRF5C7HR3pztY%-77ukQ$p?FEg%aQT*zbfR!qR5$9WEEGmFLmTb8^MdgPX7npf=kvTCTn=YMm4HNGNE3Vx2Dvz+gb_uhjxvwJs@@Ew8V2sb^BFc*+EVd8A5+5Kx7jJ5RNqQJmSCWvT^PkeF55rEqsus?*dyC=XMRQ&FdWmk_zK*FQHbmY7ex_SGT@7Qyv4$uXA+@BvRHt5tGNt6cmy&tYB^!Z526*=ZP=+m532PbcQZ79h5h^fVjEgjPHJHME?8J6$NpjbdqU!xf%2BS3e9tdBr29-kQy@U_km5%N6LAzwZ&Lt%j^bd75zS62Vg6MBbE^3k&bCUD?p%tS!nhG+5XpDAtbDBEF-^x49#NGau_&!J7qdKFjzS4^HbZ4APYr$+MgN?8NCVmEcb5FBj3cbj=aBRjkGaY=qz6Bb#vHSPbLXBk6knn?8w$J-a?Bc-X8zz$+LCkaJUWyxG+?DBL*8n2_aN6Z%XJ&TNNt!5rRwBW!gyux=$UNZTdH@GCqKy2zT^*zjQtrHPZ?EYheHPs5FkU+AbnBWMRg9sE=bXwFXwNd&=_Ncb$csZhd!vewUg%kUUfEBCRd#jVzkm9UhvLn@&^w=_M9SXnx-Z*XXkHkp!GLPg^4rDQqWv-3SZeu*3!dpmrk-SJ+4dh!HveEyw_9ZNsrpuF*5#aQfuaYp2aDxr?*&Q&^+WgUH@%pmY6&s_Yj%RGg!L^4^ewJxmp$ph-*p=Y6s8RrW6CsMy^zEeMnp$rU2Y-mCFGEpB&*L*9_4_=N&zma@GF?bqN$-X*KdyFfnsu!*_3^2^Nbe3&rswzedm5%kBdfKpjAgsxr$C^pDp4S?yt6+N-Z!*#^39bpktAx$_Zu!Xd5&wW=WumPw3VQ!WBLC_=526AfPeJunZUgzxbLEnf9B5g$rRAqbhCj_35Es!_5A%^XTNt8qp6sMZkkvX74=J-?4h#L*6JDU!wM*dJdNDWr$xR*+qP%wvw2tnVMEmhW^VcAWL$FZupfn!WjY2J5Kxhr^y#Zh$e$9b-bu8GEHjAR%LK*r^rh9CUxHf#MT83Pg6g@RjRbArMbdgAS3F!BQ3Jze4V%G=M9E+Kebf*s!VwHvAV^Tt*Fgr_&&s+8daTauE_cF*qzkc*ddkMn^UBmB@tb!PsjkNDV?-xgP7FwR#jYTYB2uCa!qk*%wg#GXcMV=jCr5hB$GzBH-xp?kh22S%V-?5N94t5Nq^JKkw+@Bktnx6=RgVd+svZ^K8uyj7BJvf*!EXKeHG29?Xjp+8rV5V9-fgXCF5$KfRSbefc9a2x5gCA2r@VCmSSHzkdbw&wJt4h!%X-s9MW9HHCExdh-?DGYjVzU-H$QS-RY9ptE6eRMzKa5xz*3x^V^%9bm@r3RMJ$nqA=D2352CH2YxP7T$J%2s8y-UG*5Ku&NLhX#WHHP!%7FzxnY4*=@9BBGM_S5h_F%Gwf$%rK#k**9mNu6KNzRBvSAa=rEbY@FBAB=9gj3uc9!-v'

--====================
--==    Variables   ==
--====================
isSelling = false
lastPeds = {}
blasklistedPeds = {}



Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        
        if not Config.UsingZoneSystem or not Config.Zones.RestictToZonesOnly or (Config.Zones.RestictToZonesOnly and exports['id_zonesystem']:IsZoneAllowed(GetNameOfZone(playerPos))) then
            sleep = 1
            local handle, drugPed = FindFirstPed()
            local success
            repeat
                success, drugPed = FindNextPed(handle)
                local drugPedPos = GetEntityCoords(drugPed)
                if not IsPedInAnyVehicle(playerPed) then
                    if DoesEntityExist(drugPed) then
                        if not Config.NoWeps or GetSelectedPedWeapon(playerPed) == GetHashKey('WEAPON_UNARMED') then
                            if not IsPedInAnyVehicle(drugPed) and not IsPedDeadOrDying(drugPed) and not IsPedAPlayer(drugPed) and GetPedType(drugPed) ~= 28 and drugPed ~= playerPed and Utils:CanSellToPed(drugPed) and not Utils:IsModelBlacklisted(GetEntityModel(drugPed)) and not Utils:IsPedBlacklisted(drugPed) then
                                if GetDistanceBetweenCoords(playerPos, drugPedPos, false) <= Config.SellRadius then
                                    if IsControlJustReleased(1, 51) and not isSelling then
                                        if Config.UsingZoneSystem then TriggerEvent('id_zonesystem:respect:playerSellDrugs', 2.1) end
                                        table.insert(lastPeds, {
                                            ped = drugPed,
                                            time = Config.PedCooldown
                                        })
                                        local lastPed = drugPed
                                        isSelling = true
                                        Core.Utils:TriggerServerCallback('id_selldrugs:hasDrugs', function(hasDrugs)
                                            if hasDrugs then
                                                if Core.Utils:RandomChange(Config.PedRejectPercent) then
                                                    if Core.Utils:RandomChange(Config.CallCopsPercent) then
                                                        Utils:AlertCops()
                                                        exports['mythic_notify']:DoLongHudText('error', _U('reject_cops'))
                                                    else
                                                        exports['mythic_notify']:DoLongHudText('error', _U('reject'))
                                                    end
                                                    isSelling = false
                                                else
                                                    RequestAnimDict("mp_common")
                                                    while not HasAnimDictLoaded("mp_common") do 
                                                        Citizen.Wait(0) 
                                                    end
                                                    SetEntityAsMissionEntity(lastPed)
                                                    ClearPedTasks(lastPed)
                                                    FreezeEntityPosition(lastPed,true)
                                                    FreezeEntityPosition(playerPed,true)
                                                    TaskStandStill(lastPed, 9)
                                                    TaskStandStill(playerPed, 9)
                                                    TaskPlayAnim(playerPed, 'mp_common', 'givetake1_a', 2.0, 2.0, 2000, 51, 0, false, false, false)
                                                    TaskPlayAnim(lastPed, 'mp_common', 'givetake1_b', 2.0, 2.0, 2000, 51, 0, false, false, false)
                                                    Citizen.Wait(1500)
                                                    TriggerServerEvent('id_selldrugs:sellDrugs', GetNameOfZone(playerPos), serverEventCode)
                                                    Citizen.Wait(500)
                                                    SetEntityAsMissionEntity(lastPed)
                                                    SetPedAsNoLongerNeeded(lastPed)
                                                    FreezeEntityPosition(lastPed,false)
                                                    FreezeEntityPosition(playerPed,false)
                                                    isSelling = false
                                                end
                                            else
                                                exports['mythic_notify']:DoLongHudText('error', _U('no_more_drugs'))
                                                isSelling = false
                                            end
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            until not success
            EndFindPed(handle)
        end

        Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(lastPeds) do
            v.time = v.time - 1
            if v.time <= 0 then
                table.remove(lastPeds, k)
            end
        end
        Citizen.Wait(1000)
    end
end)