local QBCore = exports['qb-core']:GetCoreObject()

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent('moneywashing:Menu', function()
    exports['qb-menu']:openMenu({
 		{ header = "", txt = "✘ Close", params = { event = "moneywashing:TradeAnim", args = -2 } },
		{ header = "Let Johnny take a look at your goods..", params = { event = "moneywashing:TradeAnim", args = 1 } },
        { header = "Collect your goods.", params = { event = "moneywashing:TradeAnim", args = 2 } },
    })
end)

RegisterNetEvent('moneywashing:TradeAnim')
AddEventHandler('moneywashing:TradeAnim', function(data)
	local pid = PlayerPedId()
	loadAnimDict("mp_common")
	TriggerServerEvent('moneywashing:SellItems', data)
        pCoords = GetEntityCoords(PlayerPedId())
        ppCoords = GetEntityCoords(v)
        dist = #(pCoords - ppCoords)
        if dist < 2 then 
			TaskPlayAnim(pid, "mp_common", "givetake2_a", 100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
            TaskPlayAnim(v, "mp_common", "givetake2_a", 100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
            Wait(1500)
            StopAnimTask(pid, "mp_common", "givetake2_a", 1.0)
            StopAnimTask(v, "mp_common", "givetake2_a", 1.0)
            RemoveAnimDict("mp_common")
		end
end)