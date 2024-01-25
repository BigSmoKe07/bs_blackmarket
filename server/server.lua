local Config = require 'config'
local Utils = require 'utils'
 
exports.ox_inventory:RegisterStash('bs_sellshop', 'Sell Products', 10, 10000)


RegisterServerEvent('bs_blackmarket:createshop', function(data)
    CreateThread(function()
        exports.ox_inventory:RegisterShop('BlackMarket', {
            name = 'Black Market',
            inventory = Config.buyItem,
            location = {
                data.shop
            },
        })
    end)
end)

    swapHook = exports.ox_inventory:registerHook('swapItems', function(payload)
        if payload.toInventory == 'bs_sellshop' then
            local item = payload.fromSlot.name
            local price = Utils.getItemPrice(item)
            if not price then lib.notify(payload.source,{
                title = 'Jack',
                description = "I won't buy these shits",
                type = 'error'
            }) return end
            TriggerClientEvent('ox_inventory:closeInventory', payload.source)
            CreateThread(function()
                Wait(0)
            if exports.ox_inventory:RemoveItem(payload.toInventory, item, payload.count) then  
            exports.ox_inventory:AddItem(payload.source,'black_money', price*payload.count)
            end 
            end)

        end
    end, {})
