local Utils = require 'utils'

CreateThread(function ()
    local location = Utils.getRandomLocation()
    TriggerServerEvent('bs_blackmarket:createshop', location)
    Utils.spawnVehicle('cargobob', location.coords)
    for _, v in pairs(location.extra) do
        local obj = Utils.spawnModel(v.name, v.coords)
    end
    local ped = Utils.spawnPed('s_m_y_ammucity_01', location.shop)  
    exports.ox_target:addLocalEntity(ped,  {
        {
            label = 'Buy Products',
            icon = 'fa-solid fa-cart-shopping',
            name = 'blackmarket_dealer',
            onSelect = function()
                exports.ox_inventory:openInventory('shop',{ type = 'BlackMarket'})
            end,
        }
    })
    local sellped = Utils.spawnPed('s_m_y_ammucity_01', location.sellshop)  
    exports.ox_target:addLocalEntity(sellped,  {
        {
            label = 'Sell Products',
            icon = 'fa-solid fa-sack-dollar',
            name = 'blackmarket_seller',
            onSelect = function()
                exports.ox_inventory:openInventory('stash', 'bs_sellshop')
            end,
        }
    })
end)