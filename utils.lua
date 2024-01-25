local Config = require 'config'
local Utils = {}

function Utils.getRandomLocation()
    return Config.marketLocation[math.random(1, #Config.marketLocation)]
end

function Utils.spawnModel(model,coords)
    lib.requestModel(model)
    local obj = CreateObject(joaat(model), coords.x, coords.y, coords.z, false, true, false)
    SetEntityHeading(obj, coords.w)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj,true)
    return obj
end

function Utils.spawnVehicle(model,coords)
    lib.requestModel(model)
    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, true, true)
    FreezeEntityPosition(veh,true)
    SetVehicleDoorOpen(veh, 3, false, false)
    SetVehicleDoorOpen(veh, 2, false, false)
    SetVehicleDoorsLocked(veh,2)
    SetVehicleUndriveable(veh,true)
    SetEntityInvincible(veh, true)
    return veh
end

function Utils.spawnPed(model,coords)
    lib.requestModel(model)
    local ped = CreatePed(4, model, coords.x, coords.y, coords.z, coords.w, false, true)
    SetEntityHeading(ped, coords.w)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped,true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'PROP_HUMAN_STAND_IMPATIENT', 0, true)
    return ped
end

function Utils.getItemPrice(item)
    return Config.sellableItem[item] or nil
end

return Utils 
