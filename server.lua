local QBCore = exports['qb-core']:GetCoreObject()

local items = {
    { name: 'weapon_combatpistol', count: 1},
    { name: 'pistol_ammo', count: 15},
    { name: 'weapon_stungun', count: 1},
    { name: 'bandage', count: 10},
    { name: 'heavyarmor', count: 10},
    { name: 'handcuffs', count: 5},
    { name: 'pkelepceanahtar', count: 1},
    { name: 'radio', count: 1},
    { name: 'weapon_nightstick', count: 1},
}


RegisterNetEvent("moment:kusan")
AddEventHandler("moment:kusan", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        for i=1, #items, 1 do
            Player.Functions.AddItem(items[i].name, items[i].count)	        
        end
        TriggerClientEvent('QBCore:Notify', src, 'Polis kiti başarıyla açıldı!', 'success', 5000)


end)

QBCore.Functions.CreateUseableItem('pdkit', function(source,item)
    local Player = QBCore.Functions.GetPlayer(source)


        if not Player.Functions.GetItemByName('pdkit') then
            return TriggerClientEvent('QBCore:Notify', source, 'Polis kiti bulunamadı!', 'error', 5000)
        end

    TriggerEvent('moment:kusan', source, 'pdkit', item)
end)