ESX = nil
local timerekk = 0

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end
end)

RegisterNetEvent('w_kits:openMenu', function(source, premium, premiumplus, timer)

    -- print(source)
    openKitMenu(premium, premiumplus, timer)

end)

RegisterNetEvent('w_kits:cooldown', function()

    timerekk = 1800000

end)

openKitMenu = function (kolorpremium, kolorpremiumplus)
    ESX.UI.Menu.CloseAll()
    -- print(timerekk)
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'kity',
        {
            align    = 'center',
            title    = 'Menu Kitów',
            elements = {
                    {label = '<font style="color: green;">KIT | 1 ( GRACZ ) </font>',  value = Config.KitGracz, ranga = 'user'},
                    {label = '<font style="color: green;">KIT | 1 ( GRACZ ) </font>',  value = Config.KitGracz2, ranga = 'user'},
                    {label = '<font style="color: orange">KIT | 1 ( PREMIUM )',  value = Config.KitPremium, ranga = 'premium'},
                    {label = '<font style="color: orange">KIT | 2 ( PREMIUM )',  value = Config.KitPremium2, ranga = 'premium'},
                    {label = '<font style="color: #ba03fc">KIT | 1 ( PREMIUM + )',  value = Config.KitPremiumPlus, ranga = 'premiumplus'},
                    {label = '<font style="color: #ba03fc">KIT | 2 ( PREMIUM + )',  value = Config.KitPremiumPlus2, ranga = 'premiumplus'},
            }
        },
        function(data, menu)
            if(timerekk == 0) then
                TriggerServerEvent('w_kits:odbierzKitServer', data.current.value, data.current.ranga)
            else
                ESX.ShowNotification('~r~Odczekaj ~o~' .. timerekk / 60000 .. 'm ~r~ aby ponownie odebrac kit' )
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

CreateThread(function()

    while(true) do

        Wait(60000)

        -- print(timer)

        if(timerekk > 0) then
            timerekk = timerekk - 60000
        end

    end

end)