ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('mrv_robapu:rewards')
AddEventHandler('mrv_robapu:rewards', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local rewards = 1300

    xPlayer.addMoney(rewards)
end)

RegisterServerEvent('mrv_robapu:rewardsfood')
AddEventHandler('mrv_robapu:rewardsfood', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local items = {"bread", "water", "malbora", "whisky"}

    xPlayer.addInventoryItem(items[math.random(#items)], 1)
end)

RegisterServerEvent('mrv_robapu:callPolice')
AddEventHandler('mrv_robapu:callPolice', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

        for i = 1, #xPlayers, 1 do
        if xPlayer.job.name == 'police' then
        TriggerClientEvent('esx:showNotification', xPlayers[i], 'Un civil vous a envoyé un message : Apu se fait ~r~braquer~s~ !')
        end
    end
end) 