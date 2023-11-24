Config = {}

--===================
--==    General    ==
--===================
--[[
    Distancen på hvor tæt på du skal være på en marker før den vises
    OBS: Skal være et decimal tal
    f.eks 25.0 - for 25
]]
Config.DrawDistance = 25.0

--[[
    Angiv om du bruger vores zone system
    https://identity.tebex.io/package/5026180
]]
Config.UsingZoneSystem = false

--[[
    Angiv om du bruger vores bandesystem
    Link: https://identity.tebex.io/package/5026176

    Bruger du ikke vores system, kan du implementerer dit eget i utils filerne
]]
Config.UsingGangSystem = false

-- Procenten for at npc'en afslår ens tilbud
Config.PedRejectPercent = 30

-- Procenten for at npc'en tilkalder politiet, hvis man bliver afslået
Config.CallCopsPercent = 10

-- Hvor langtid politi alert blip skal blive vist på kortet (I sekunder)
Config.BlipTime = 25

-- Cooldown på hvor lang tid før man kan sælge til den samme npc igen (I sekunder)
Config.PedCooldown = 60

-- Radius imellem spiller og npc for at kunne sælge.
Config.SellRadius = 1.0

-- Blacklisted PED models - Modeller man ikke kan sælge til
Config.BlacklistedModels = {
    's_m_y_dealer_01',
    's_m_m_highsec_01',
    's_m_m_highsec_02',
    's_m_m_scientist_01',
    's_m_m_chemsec_01'
}

-- Angiv om man ikke må have våben i hånden når man sælger
Config.NoWeps = true

--[[
    Maksimalt antal at betjente den ganger op med i `copMultiplier`
        f.eks. er den sat til 5 og der er 6 betjente på, vil copMultiplier blive ganget med 5
]]
Config.MaxCops = 4

--[[
    Maksimalt antal stoffer man kan sælge på et salg
        -1 - for intet limit
]]
Config.MaxSellAmount = 10

--[[
    De forskellige drugs der kan sælges.
    [item]: Item name på stoffet
    [price]: Prisen for 1x
    [copMultiplier]: Hvor meget prisen bliver ganget op alt efter hvor mange betjente der er på
        f.eks. er den på 0.4 og der er 4 betjente online vil prisen for 1x stof være 0.4 * 4 * pris
]]
Config.Drugs = {
    { -- Weed
        item = 'weed',
        price = 278,
        copMultiplier = 0.25 
    },
    { -- Joints
        item = 'weed_packed',
        price = 312,
        copMultiplier = 0.25
    },
    { -- Kokain
        item = 'coke',
        price = 299,
        copMultiplier = 0.25
    },
    { -- Pakket Kokain
        item = 'coke_packed',
        price = 321,
        copMultiplier = 0.25
    },
    { -- Heroin
        item = 'heroin',
        price = 274,
        copMultiplier = 0.25
    },
    { -- Pakket Heroin kanyler
        item = 'heroin_packed',
        price = 304,
        copMultiplier = 0.25
    },
}

--================
--==    Zones   ==
--================
Config.Zones = {}

--[[
    Angiv om man kun skal kunne sælge i de zoner der er angivet i zone scriptet
    OBS: Kræver at `Config.UsingZoneSystem` er slået til
]]
Config.Zones.RestictToZonesOnly = false