ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('kit', function(source, args, rawCommand)
    local wFivem = ESX.GetPlayerFromId(source)
    local hasPremium = "red"
    local hasPremiumPlus = "red"
    if(wFivem.group == 'premium') then
        hasPremium = "green"
    elseif(wFivem.group == 'premiumplus') then
        hasPremiumPlus = "green"
    end
    if args[1] == nil then
        TriggerClientEvent('w_kits:openMenu', source, hasPremium, hasPremiumPlus, 1)
    end
end)

RegisterServerEvent('w_kits:odbierzKitServer', function(kit, ranga)
    local xPlayer = ESX.GetPlayerFromId(source)
    -- print(json.encode(kit) .. ' ' .. ranga)

    if(ranga == xPlayer.group) then
        odbierzKit(source, json.encode(kit))
        TriggerClientEvent('w_kits:cooldown', source)
    elseif(ranga == 'user') then    
        odbierzKit(source, json.encode(kit))
    else
        xPlayer.showNotification('~r~Nie posiadasz uprawnień aby odebrać ten zestaw')
    end


end)

odbierzKit = function (source, kit)

    local wFivem = ESX.GetPlayerFromId(source)

        
    for k,v in pairs(json.decode(kit)) do
        -- print(k .. ' ' .. v)
        wFivem.addInventoryItem(k, v)
    end

end
