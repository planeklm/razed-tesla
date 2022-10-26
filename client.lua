local approvedTesla
Citizen.CreateThread(function()
    while true do
        local sleep = 1500
        local intesla = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
        for i=1, #Config.Teslas do
            if intesla == Config.Teslas[i] then
                approvedTesla = true
            else
                approvedTesla = nil
            end
        end
        if approvedTesla then
            sleep = 0
            local updatesetting = nil 
            if Config.Setting == "MPH" then 
                updatesetting = "updatemph"

            elseif Config.Setting == "KMH" then 
                updatesetting = "updatekmh"
            end
            --TriggerServerEvent("InteractSound_SV:PlayOnSource", "teslaon", 0.3) Not WORKING
            SendNUIMessage({type = 'ui' , status = true})
            if Config.Speed == "K" then Config.Speed = 3.6 elseif Config.Speed == "M" then Config.Speed = 2.2 end
                --THIS IS REALLY MESSY!
                fuelLevel = exports[Config.FuelSetting]:GetFuel(GetVehiclePedIsIn(PlayerPedId(), false))
                coords = GetEntityCoords(PlayerPedId(), false)
                fuelLevelRounded = "⚡" .. math.floor(fuelLevel) .. " "
                vehicleGears = "⚙️" .. math.floor(GetVehicleCurrentGear(GetVehiclePedIsIn(PlayerPedId(), false)))
                currentspeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * Config.Speed
                currentspeed = math.floor(currentspeed)
                speed = currentspeed .. ""
                halfspeed = currentspeed/3
                halfspeed = halfspeed .. "%"
                -- This is the words on the UI down below.
                fuel =  fuelLevelRounded .. " " .. vehicleGears
                SendNUIMessage({type = 'updatefuelpercentage', fuel = fuel})
                SendNUIMessage({type = updatesetting, speed = speed, speedwidth = halfuel})
                SendNUIMessage({type = 'updatefuel', fuel = fuelwidth})
        else
            SendNUIMessage({type = 'ui' , status = false})
            --TriggerServerEvent("InteractSound_SV:PlayOnSource", "teslaoff", 0.3) Not WORKING
        end
        Citizen.Wait(sleep)
    end
end)
