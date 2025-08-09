local modelHashMap = {
    ['appleseed_config'] = 987516329,
    ['bountyhunter_config'] = 0x515E31ED,
    ['engine_config'] = 0x487B2BE7,
    ['gunslinger3_config'] = 0x8EAC625C,
    ['gunslinger4_config'] = 0xCD2C7CA1 ,
    ['prisoner_escort_config'] = 0x005E03AD,
    ['winter4_config'] = 0x3260CE89,
    ['prisoner_escort_config1'] = 0x005E03AD,
}

-- Start Train
CreateThread(function()
    StartMainPrompts()
    SetRandomTrains(false)
  --  TriggerServerEvent('bcc-train:BridgeFallHandler', true)
    while true do
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        local hour = GetClockHours()
        local sleep = 1000

        if IsEntityDead(playerPed) then
            goto continue
        end
        for station, stationCfg in pairs(Stations) do
            if stationCfg.shop.hours.active then
                -- Using Shop Hours - Shop Closed
                if hour >= stationCfg.shop.hours.close or hour < stationCfg.shop.hours.open then
                    if stationCfg.blip.show and stationCfg.blip.showClosed then
                        if not Stations[station].Blip then
                            AddBlip(station)
                        end
                        Citizen.InvokeNative(0x662D364ABF16DE2F, Stations[station].Blip, joaat(Config.blipColors[stationCfg.blip.color.closed])) -- BlipAddModifier
                    else
                        if Stations[station].Blip then
                            RemoveBlip(Stations[station].Blip)
                            Stations[station].Blip = nil
                        end
                    end
                    if stationCfg.NPC then
                        DeleteEntity(stationCfg.NPC)
                        stationCfg.NPC = nil
                    end
                    local distance = #(pCoords - stationCfg.npc.coords)
                    if distance <= stationCfg.shop.distance then
                        sleep = 0
                        local shopClosed = CreateVarString(10, 'LITERAL_STRING',
                            stationCfg.shop.name .. _U('hours') .. stationCfg.shop.hours.open .. _U('to') .. stationCfg.shop.hours.close .. _U('hundred'))
                        PromptSetActiveGroupThisFrame(MenuGroup, shopClosed)
                        PromptSetEnabled(MenuPrompt, false)
                    end
                elseif hour >= stationCfg.shop.hours.open then
                    -- Using Shop Hours - Shop Open
                    if stationCfg.blip.show then
                        if not Stations[station].Blip then
                            AddBlip(station)
                        end
                        Citizen.InvokeNative(0x662D364ABF16DE2F, Stations[station].Blip, joaat(Config.blipColors[stationCfg.blip.color.open])) -- BlipAddModifier
                    end
                    if not stationCfg.shop.jobsEnabled then
                        local distance = #(pCoords - stationCfg.npc.coords)
                        if stationCfg.npc.active then
                            if distance <= stationCfg.npc.distance then
                                if not stationCfg.NPC then
                                    AddNPC(station)
                                end
                            else
                                if stationCfg.NPC then
                                    DeleteEntity(stationCfg.NPC)
                                    stationCfg.NPC = nil
                                end
                            end
                        end
                        if distance <= stationCfg.shop.distance then
                            sleep = 0
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', stationCfg.shop.prompt)
                            PromptSetActiveGroupThisFrame(MenuGroup, shopOpen)
                            PromptSetEnabled(MenuPrompt, true)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, MenuPrompt) then -- PromptHasStandardModeCompleted
                                MainMenu(station)
                            end
                        end
                    else
                        -- Using Shop Hours - Shop Open - Job Locked
                        if Stations[station].Blip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, Stations[station].Blip, joaat(Config.blipColors[stationCfg.blip.color.job])) -- BlipAddModifier
                        end
                        local distance = #(pCoords - stationCfg.npc.coords)
                        if stationCfg.npc.active then
                            if distance <= stationCfg.npc.distance then
                                if not stationCfg.NPC then
                                    AddNPC(station)
                                end
                            else
                                if stationCfg.NPC then
                                    DeleteEntity(stationCfg.NPC)
                                    stationCfg.NPC = nil
                                end
                            end
                        end
                        if distance <= stationCfg.shop.distance then
                            sleep = 0
                            local shopOpen = CreateVarString(10, 'LITERAL_STRING', stationCfg.shop.prompt)
                            PromptSetActiveGroupThisFrame(MenuGroup, shopOpen)
                            PromptSetEnabled(MenuPrompt, true)

                            if Citizen.InvokeNative(0xC92AC953F0A982AE, MenuPrompt) then -- PromptHasStandardModeCompleted
                                local hasJob = VORPcore.Callback.TriggerAwait('bcc-train:JobCheck', station)
                                if hasJob then
                                    MainMenu(station)
                                else
                                    VORPcore.NotifyRightTip(_U('wrongJob'), 4000)
                                end
                            end
                        end
                    end
                end
            else
                -- Not Using Shop Hours - Shop Always Open
                if stationCfg.blip.show then
                    if not Stations[station].Blip then
                        AddBlip(station)
                    end
                    Citizen.InvokeNative(0x662D364ABF16DE2F, Stations[station].Blip, joaat(Config.blipColors[stationCfg.blip.color.open])) -- BlipAddModifier
                end
                if not stationCfg.shop.jobsEnabled then
                    local distance = #(pCoords - stationCfg.npc.coords)
                    if stationCfg.npc.active then
                        if distance <= stationCfg.npc.distance then
                            if not stationCfg.NPC then
                                AddNPC(station)
                            end
                        else
                            if stationCfg.NPC then
                                DeleteEntity(stationCfg.NPC)
                                stationCfg.NPC = nil
                            end
                        end
                    end
                    if distance <= stationCfg.shop.distance then
                        sleep = 0
                        local shopOpen = CreateVarString(10, 'LITERAL_STRING', stationCfg.shop.prompt)
                        PromptSetActiveGroupThisFrame(MenuGroup, shopOpen)
                        PromptSetEnabled(MenuPrompt, true)

                        if Citizen.InvokeNative(0xC92AC953F0A982AE, MenuPrompt) then -- PromptHasStandardModeCompleted
                            MainMenu(station)
                        end
                    end
                else
                    -- Not Using Shop Hours - Shop Always Open - Job Locked
                    if Stations[station].Blip then
                        Citizen.InvokeNative(0x662D364ABF16DE2F, Stations[station].Blip, joaat(Config.blipColors[stationCfg.blip.color.job])) -- BlipAddModifier
                    end
                    local distance = #(pCoords - stationCfg.npc.coords)
                    if stationCfg.npc.active then
                        if distance <= stationCfg.npc.distance then
                            if not stationCfg.NPC then
                                AddNPC(station)
                            end
                        else
                            if stationCfg.NPC then
                                DeleteEntity(stationCfg.NPC)
                                stationCfg.NPC = nil
                            end
                        end
                    end
                    if distance <= stationCfg.shop.distance then
                        sleep = 0
                        local shopOpen = CreateVarString(10, 'LITERAL_STRING', stationCfg.shop.prompt)
                        PromptSetActiveGroupThisFrame(MenuGroup, shopOpen)
                        PromptSetEnabled(MenuPrompt, true)

                        if Citizen.InvokeNative(0xC92AC953F0A982AE, MenuPrompt) then -- PromptHasStandardModeCompleted
                            local hasJob = VORPcore.Callback.TriggerAwait('bcc-train:JobCheck', station)
                            if hasJob then
                                MainMenu(station)
                            else
                                VORPcore.NotifyRightTip(_U('wrongJob'), 4000)
                            end
                        end
                    end
                end
            end
        end
        ::continue::
        Wait(sleep)
    end
end)

-- ReplaceCabinInterior remains the same but accepts any carriage entity
local function ReplaceCabinInterior(carriage, interior)
    local propset = Citizen.InvokeNative(0xCFC0BD09BB1B73FF, carriage)
    local propsetHash = Citizen.InvokeNative(0xA6A9712955F53D9C, propset)
    local request = Citizen.InvokeNative(0xF3DE57A46D5585E9, interior)

    if Citizen.InvokeNative(0xF42DB680A8B2A4D9, propset) then
        while not Citizen.InvokeNative(0x48A88FC684C55FDC, propsetHash) do
            Wait(1)
        end
        Citizen.InvokeNative(0x3BCF32FF37EA9F1D, carriage)
    else
        return false
    end

    while not Citizen.InvokeNative(0x48A88FC684C55FDC, interior) do
        Wait(1)
    end

    local attachedPropset = Citizen.InvokeNative(0x9609DBDDE18FAD8C, interior, 0, 0, 0, carriage, 0, true, 0, true)

    Citizen.InvokeNative(0xB1964A83B345B4AB, interior)
    return true
end

local function UnlockCabinDoors(carriage)
    Citizen.InvokeNative(0x550CE392A4672412, carriage, 9, true, true)   -- Open cabin doors
    Citizen.InvokeNative(0x550CE392A4672412, carriage, 10, true, true)
    Citizen.InvokeNative(0x550CE392A4672412, carriage, 11, true, true)
end

-- Main handler accepting a list of carriages
local function HandleTrainCarriages(train, carriageIndices)
    local barCreated = false

    CreateThread(function()
        while true do
            Wait(1000)

            for _, index in ipairs(carriageIndices) do
                local carriage = Citizen.InvokeNative(0xD0FB093A4CDB932C, train, index)

                if carriage and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(carriage)) < 150 then
                    if index == carriageIndices[2] then
                        -- First carriage (e.g., bar)
                        if not barCreated then
                            barCreated = ReplaceCabinInterior(carriage, -1747631964)
                        end
                    elseif index == carriageIndices[3] or index == carriageIndices[4] then
                        -- Carriages for doors
                        UnlockCabinDoors(carriage)
                    end
                end
            end
        end
    end)
end

function SpawnTrain(trainCfg, myTrainData, dirChange, station)
    -- Map the model string to the hash
    local modelName = trainCfg.model -- e.g., 'appleseed_config'
    local trainHash = modelHashMap[modelName]
    if not trainHash then
        print("Error: No hash found for model:", modelName)
        return
    end

    -- Assign train id and fuel/condition data
    TrainFuel = myTrainData.fuel
    TrainCondition = myTrainData.condition
    TrainId = myTrainData.trainid

    -- Load train cars and spawn
    LoadTrainCars(trainHash)
    local coords = Stations[station] and Stations[station].train.coords
    if not coords then
        print("Invalid station index or missing coords")
        return
    end

    MyTrain = Citizen.InvokeNative(0xc239dbd9a57d2a71, trainHash, coords, dirChange, false, true, false)
    SetModelAsNoLongerNeeded(trainCfg.model)

    -- Freeze the train at spawn speed
    Citizen.InvokeNative(0xDFBA6BBFF7CCAFBB, MyTrain, 0.0)
    Citizen.InvokeNative(0x01021EB2E96B793C, MyTrain, 0.0)
    
    -- Server sync
    TriggerServerEvent('bcc-train:UpdateTrainSpawnVar', true, MyTrain)

    -- Blip setup
    if trainCfg.blip and trainCfg.blip.show then
        local trainBlip = Citizen.InvokeNative(0x23f74c2fda6e7c61, -1749618580, MyTrain)
        SetBlipSprite(trainBlip, joaat(trainCfg.blip.sprite), true)
        Citizen.InvokeNative(0x9CB1A1623062F402, trainBlip, trainCfg.blip.name)
        Citizen.InvokeNative(0x662D364ABF16DE2F, trainBlip, joaat(Config.blipColors[trainCfg.blip.color] or 'WHITE'))
    end

    -- Inventory registration
    if trainCfg.inventory and trainCfg.inventory.enabled then
        TriggerServerEvent('bcc-train:RegisterInventory', TrainId, trainCfg.model)
    end

    -- Fuel handling
    if trainCfg.fuel and trainCfg.fuel.enabled then
        TriggerEvent('bcc-train:FuelDecreaseHandler', trainCfg, myTrainData)
    end

    -- Condition handling
    if trainCfg.condition and trainCfg.condition.enabled then
        TriggerEvent('bcc-train:CondDecreaseHandler', trainCfg, myTrainData)
    end

    -- Show target menu if fuel or condition active
    if (trainCfg.fuel and trainCfg.fuel.enabled) or (trainCfg.condition and trainCfg.condition.enabled) then
        TriggerEvent('bcc-train:TargetMenu', trainCfg)
    end

    -- Handle train with dynamic carriages
    local carriageIndicesToHandle = {3, 4, 5, 6} -- customize per train
    HandleTrainCarriages(MyTrain, carriageIndicesToHandle)

    -- General train handling
    TriggerEvent('bcc-train:TrainHandler', trainCfg, myTrainData)
    TriggerEvent('bcc-train:TrainActions')
end
AddEventHandler('bcc-train:TrainHandler', function(trainCfg, myTrainData)
    DrivingMenuOpened = false
    while MyTrain do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local isDead = IsEntityDead(playerPed)
        local distance = #(GetEntityCoords(playerPed) - GetEntityCoords(MyTrain))
        if distance >= Config.despawnDist or isDead then
            if MyTrain then
                if not isDead then
                    VORPcore.NotifyRightTip(_U('tooFarFromTrain'), 4000)
                end
                TriggerEvent('bcc-train:ResetTrain')
                break
            end
        elseif distance <= 10 then
            sleep = 0
            if not Citizen.InvokeNative(0xE052C1B1CAA4ECE4, MyTrain, -1) and GetPedInVehicleSeat(MyTrain, -1) == playerPed then -- IsVehicleSeatFree
                if not DrivingMenuOpened then
                    DrivingMenuOpened = true
                    DrivingMenu(trainCfg, myTrainData)
                    ShowHUD(TrainCondition, trainCfg.condition.maxAmount, TrainFuel, trainCfg.fuel.maxAmount)
                end
            else
                if DrivingMenuOpened then
                    DrivingMenuOpened = false
                    VORPMenu.CloseAll()
                    HideHUD()
                    ForwardActive = false
                    BackwardActive = false
                end
            end
        end
        Wait(sleep)
    end
end)

AddEventHandler('bcc-train:FuelDecreaseHandler', function(trainCfg, myTrainData)
    local fuelEmpty = false
    while MyTrain do
        Wait(1000)
        if EngineStarted and TrainFuel >= 1 then
            Wait(trainCfg.fuel.decreaseTime * 10000)
            local fuel = VORPcore.Callback.TriggerAwait('bcc-train:DecTrainFuel', TrainId, TrainFuel, trainCfg)
            if fuel then
                FuelUpdate(fuel)
            end
        else
            Citizen.InvokeNative(0x9F29999DFDF2AEB8, MyTrain, 0.0) -- SetTrainMaxSpeed
        end
        if TrainFuel <= 0 and not fuelEmpty then
            fuelEmpty = true
            EngineStarted = false
            Citizen.InvokeNative(0x9F29999DFDF2AEB8, MyTrain, 0.0) -- SetTrainMaxSpeed
            if DrivingMenuOpened then
                DrivingMenu(trainCfg, myTrainData)
            end
        elseif fuelEmpty and TrainFuel >= 1 then
            fuelEmpty = false
        end
    end
end)

AddEventHandler('bcc-train:CondDecreaseHandler', function(trainCfg, myTrainData)
    local conditionEmpty = false
    while MyTrain do
        Wait(1000)
        if EngineStarted and TrainCondition >= 1 then
            Wait(trainCfg.condition.decreaseTime * 100000)
            local cond = VORPcore.Callback.TriggerAwait('bcc-train:DecTrainCond', TrainId, TrainCondition, trainCfg)
            if cond then
                ConditionUpdate(cond)
            end
        else
            Citizen.InvokeNative(0x9F29999DFDF2AEB8, MyTrain, 0.0) -- SetTrainMaxSpeed
        end
        if TrainCondition <= 0 and not conditionEmpty then
            conditionEmpty = true
            EngineStarted = false
            Citizen.InvokeNative(0x9F29999DFDF2AEB8, MyTrain, 0.0) -- SetTrainMaxSpeed
            if DrivingMenuOpened then
                DrivingMenu(trainCfg, myTrainData)
            end
        elseif conditionEmpty and TrainCondition >= 1 then
            conditionEmpty = false
        end
    end
end)

-- Open Train Inventory
AddEventHandler('bcc-train:TrainActions', function()
    local invKey = Config.keys.inventory
    while MyTrain do
        local playerPed = PlayerPedId()
        Wait(0)
        if Citizen.InvokeNative(0x580417101DDB492F, 0, invKey) then -- IsControlJustPressed
            if not Citizen.InvokeNative(0x6F972C1AB75A1ED0, playerPed) then -- IsPedInAnyTrain
                goto continue
            end
            local dist = #(GetEntityCoords(playerPed) - GetEntityCoords(MyTrain))
            if dist <= 10 then
                TriggerServerEvent('bcc-train:OpenInventory', TrainId)
            end
            ::continue::
        end
    end
end)

-- Cleanup
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if MyTrain then
        DeleteEntity(MyTrain)
        HideHUD()
    end
    for _, stationCfg in pairs(Stations) do
        if stationCfg.Blip then
            RemoveBlip(stationCfg.Blip)
            stationCfg.Blip = nil
        end
        if stationCfg.NPC then
            DeleteEntity(stationCfg.NPC)
            stationCfg.NPC = nil
        end
    end
    VORPMenu.CloseAll()
    DisplayRadar(true)
    if DestinationBlip then
        RemoveBlip(DestinationBlip)
        DestinationBlip = nil
    end
    if DeliveryBlip then
        RemoveBlip(DeliveryBlip)
        DeliveryBlip = nil
    end
end)

AddEventHandler('playerDropped', function ()
    if MyTrain then
        DeleteEntity(MyTrain)
        MyTrain = nil
        TriggerServerEvent('bcc-train:UpdateTrainSpawnVar', false)
    end
end)
