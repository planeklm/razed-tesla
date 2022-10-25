Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local intesla = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
        if intesla == Config.Tesla then
        local updatesetting = nil 
        if Config.Setting == "MPH" then 
            updatesetting = "updatemph"
        elseif Config.Setting == "KMH" then 
            updatesetting = "updatekmh"
        end
            --TriggerServerEvent("InteractSound_SV:PlayOnSource", "teslaon", 0.3) Not WORKING
            SendNUIMessage({type = 'ui' , status = true})

            --THIS IS REALLY MESSY!
            fuelLevel = exports[Config.FuelSetting]:GetFuel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            coords = GetEntityCoords(GetPlayerPed(-1), false)
            fuelLevelRounded = "⚡" .. math.floor(fuelLevel) .. " "
            vehicleGears = "⚙️" .. math.floor(GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
            currentspeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
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
    end
end)
