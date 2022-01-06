local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("moneywashing:SellItems")
AddEventHandler("moneywashing:SellItems", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if data == 1 then
		bills = Player.Functions.GetItemByName("markedbills").amount
		money = (bills * Config.Bills)
		if Player.Functions.GetItemByName('markedbills') ~= nil and Player.Functions.GetItemByName('markedbills').amount >= 1 then
			Player.Functions.RemoveItem('markedbills', bills)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "remove", bills)
			TriggerClientEvent('QBCore:Notify', src, "Give me cover for " ..Config.WashTime.. " minutes and I will have it cleaned.", 'success')
            TriggerEvent('moneywash:startTimer')
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have what I am looking for....", 'error')
		end
    elseif data == 2 then
        if busy == false then
            Player.Functions.AddMoney('cash', money)
            TriggerClientEvent('QBCore:Notify', src, "Here is your $ "..money.. "", 'success')
            money = 0
        else
            TriggerClientEvent('QBCore:Notify', src, "Yo comeback when its ready, I got other shit to do.", 'error')
			print(timer)
        end
	end
end)

RegisterServerEvent('moneywash:startTimer')
AddEventHandler('moneywash:startTimer', function()
    busy = true
    timer = Config.WashTime * 60
    
    while busy do
        timer = timer - 1
        if timer <= 0 then
            busy = false
        end
        Citizen.Wait(1000)
    end
end)