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
            
            local teslaspeed = 
            SendNUIMessage({type = 'ui' , status = true})
            if Config.Setting == "KMH" then teslaspeed = 3.6 elseif Config.Setting == "MPH" then teslaspeed = 2.2 end
                --THIS IS REALLY MESSY!
                if Config.FuelSetting == 'ox_fuel' then
                    fuelLevel = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false))
                if Config.FuelSetting == 'wtf_ev' then
                    fuelLevel = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false))
                else
                    fuelLevel = exports[Config.FuelSetting]:GetFuel(GetVehiclePedIsIn(PlayerPedId(), false))
                end
                coords = GetEntityCoords(PlayerPedId(), false)
                fuelLevelRounded = "⚡" .. math.floor(fuelLevel) .. " "
                vehicleGears = "⚙️" .. math.floor(GetVehicleCurrentGear(GetVehiclePedIsIn(PlayerPedId(), false)))
                currentspeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * teslaspeed
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
    
