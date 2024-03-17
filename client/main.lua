local shConfig = require 'config.shared'
local engines = {"engine", "engine_a", "bumper_f"}
local ox_inventory = exports.ox_inventory

function Alerts(text, type)
    -- --Insert Custom Notification String
    lib.notify({title = 'Food Trucks', description = text, type = type, duration = 5000}) 
    -- --Insert Custom Notification String
end

function IsVehicleWhitelisted(vehicle)
    local vehicleModel = GetEntityModel(vehicle)
    for _, model in pairs(shConfig.whitelist.model) do
        if vehicleModel == GetHashKey(model) then return true end
    end
    return false
end

function HireNewEmployee(plate)
    local input = lib.inputDialog('Add Employee', {
        {type = 'number', label = 'Player ID', description = 'Player Server ID', icon = 'hashtag'},
    })
    TriggerServerEvent('dd5m_foodtrucks:server:handleEmployee', plate, input[1], 'insert')
end

function HasItem(table, recipe, plate)
    for k,v in pairs(table) do
        local hasitem = lib.callback.await('dd5m_foodtrucks:server:stashCount', false, v.item, plate)
        if hasitem < v.count then
            Alerts('You are missing some ingredients for a menu item.  Check the cooler.', error)
            return false
        end
    end
    if recipe ~= nil then
        local hasRecipe = ox_inventory:Search('count', recipe)
        if hasRecipe < 1 then
            Alerts('You must have 1x '..ox_inventory:Items()[recipe].label..' to make this item.', 'error')
            return false
        end
    end
    return true
end

function IsOwner(veh)
    local truckOwner = nil
    local citizenId = QBX.PlayerData.citizenid
    local plate = GetVehicleNumberPlateText(veh)
    truckOwner = lib.callback.await('dd5m_foodtrucks:server:getOwner', false, plate)
    if truckOwner == citizenId then
        return true
    end
    return false
end

function IsEmployee(veh)
    local plate = GetVehicleNumberPlateText(veh)
    local employeeList = lib.callback.await('dd5m_foodtrucks:server:getEmployees', false, plate)
    if employeeList ~= nil then
        for i = 1, #employeeList do
            if employeeList[i] == cache.serverId then
                return true
            end
        end
    end
    return false
end

function OpenEmployeeMenu(entity)
    local options = {}
    local plate = GetVehicleNumberPlateText(entity)
    local employeeList = lib.callback.await('dd5m_foodtrucks:server:getEmployees', false, plate)
    if employeeList ~= nil then
        for i = 1, #employeeList do
            options[#options + 1] = {
                title = 'Server ID #'..employeeList[i],
                description = 'Select to release employee.',
                icon = 'fa-solid fa-user-minus',
                onSelect = function()
                    TriggerServerEvent('dd5m_foodtrucks:server:handleEmployee', plate, employeeList[i], 'remove')
                    OpenEmployeeMenu(entity)
                end
            }
        end
    end
    options[#options + 1] = {
        title = 'New Employee',
        description = 'Enter player server ID to enable them to cook, and access stash.',
        icon = 'fa-solid fa-user-plus',
        onSelect = function()
            HireNewEmployee(plate)
            OpenEmployeeMenu(entity)
        end
    }
    lib.registerContext({
        id = 'food_truck_employees',
        title = 'Manage Employees',
        description = 'Hire or release employees.',
        canClose = false,
        menu = 'foodtruck_main_menu',
        options = options
    })
    lib.showContext('food_truck_employees')
end

function OpenMenuSelect(entity)
    local options = {}
    for k, v in pairs(shConfig.menuTypes) do
        options[#options + 1] = {
            title = v.menuTitle,
            description = v.menuDescription,
            icon = v.menuIcon,
            onSelect = function()
                Entity(entity).state:set('foodtruck:menu', k, true)
                Alerts('Truck menu set to '..v.menuTitle, 'info')
                OpenTruckMenu(entity)
            end
        }
        lib.registerContext({
            id = 'foodtruck_menu_selection',
            title = 'Set Menu',
            description = 'Select fare to be crafted and sold.',
            canClose = false,
            menu = 'foodtruck_main_menu',
            options = options
        })
        lib.showContext('foodtruck_menu_selection')
    end
end

function OpenTruckMenu(entity)
    local options = {}
    if IsOwner(entity) then
        options = {
            {
                title = 'Manage Employees',
                description = 'Hire or release employees.',
                icon = 'fa-solid fa-people-group',
                onSelect = function()
                    if shConfig.tempEmployees then
                        OpenEmployeeMenu(entity)
                    else
                        Alerts('Employees not permitted', 'error')
                    end
                end,
            },
            {
                title = 'Choose Fare',
                description = 'Choose the cooking menu.',
                icon = 'fa-solid fa-bars',
                onSelect = function()
                    OpenMenuSelect(entity)
                end,
            },
            {
                title = 'Open Safe',
                description = 'Onboard money safe.',
                icon = 'fa-solid fa-piggy-bank',
                onSelect = function()
                    ox_inventory:openInventory('stash', {id='food_truck_safe'..GetVehicleNumberPlateText(entity)})
                end,
            },
            {
                title = 'Open Cooler',
                description = 'Open ingredient stash.',
                icon = 'fa-solid fa-snowflake',
                onSelect = function()
                    ox_inventory:openInventory('stash', {id='food_truck_stash'..GetVehicleNumberPlateText(entity)})
                end,
            },
            {
                title = 'Craft Food',
                description = 'Cook a meal.',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    OpenCraftingMenu(entity, 'food')
                end
            },
            {
                title = 'Craft Drinks',
                description = 'Make a drink.',
                icon = 'fa-solid fa-beer-mug-empty',
                onSelect = function()
                    OpenCraftingMenu(entity, 'drink')
                end
            }
        }
    else
        if shConfig.employeeStashAccess then
            options = {
                {
                    title = 'Open Cooler',
                    description = 'Open ingredient stash.',
                    icon = 'fa-solid fa-snowflake',
                    onSelect = function()
                        ox_inventory:openInventory('stash', {id='food_truck_stash'..GetVehicleNumberPlateText(entity)})
                    end,
                },
                {
                    title = 'Craft Food',
                    description = 'Cook a meal.',
                    icon = 'fa-solid fa-fire-burner',
                    onSelect = function()
                        OpenCraftingMenu(entity, 'food')
                    end
                },
                {
                    title = 'Craft Drinks',
                    description = 'Make a drink.',
                    icon = 'fa-solid fa-beer-mug-empty',
                    onSelect = function()
                        OpenCraftingMenu(entity, 'drink')
                    end
                }
            }
        else
            options = {
                {
                    title = 'Craft Food',
                    description = 'Cook a meal.',
                    icon = 'fa-solid fa-fire-burner',
                    onSelect = function()
                        OpenCraftingMenu(entity, 'food')
                    end
                },
                {
                    title = 'Craft Drinks',
                    description = 'Make a drink.',
                    icon = 'fa-solid fa-beer-mug-empty',
                    onSelect = function()
                        OpenCraftingMenu(entity, 'drink')
                    end
                }
            }
        end
    end
    lib.registerContext({
        id = 'foodtruck_main_menu',
        title = 'Food Truck',
        options = options
    })
    lib.showContext('foodtruck_main_menu')
end

function OpenCraftingMenu(entity, type)
    local options = {}
    local plate = GetVehicleNumberPlateText(entity)
    local menu = Entity(entity).state['foodtruck:menu']
    for k, v in pairs(shConfig.menuTypes) do
        if menu == nil then Alerts('No menu set.', 'error') return end
        if menu == k then
            for a, b in pairs(v.items) do
                local metadata = {}
                for _, i in pairs(b.ingredients) do
                    local ingItems = {}
                    ingItems.label = ox_inventory:Items()[i.item].label
                    ingItems.value = i.count
                    metadata[#metadata + 1] = ingItems
                end
                if b.itemCategory == type then
                    if HasItem(b.ingredients, b.recipeItem, plate) then
                        options[#options + 1] = {
                            title = b.menuLabel,
                            description = 'Begin crafting a '..b.menuLabel,
                            image = 'nui://ox_inventory/web/images/'..b.itemID..'.png',
                            metadata = metadata,
                            onSelect = function()
                                if lib.progressBar({
                                    duration = b.craftTime,
                                    label = 'Crafting '..b.menuLabel,
                                    useWhileDead = false,
                                    canCancel = false,
                                    disable = {
                                        car = true,
                                        move = true,
                                        combat = true
                                    },
                                    anim = {
                                        dict = b.craftAnim.dict,
                                        clip = b.craftAnim.clip,
                                        flag = b.craftAnim.flag,
                                    },
                                    prop = {
                                        model = b.craftProp.model,
                                        bone = b.craftProp.bone,
                                        pos = b.craftProp.pos,
                                        rot = b.craftProp.rot,
                                    }
                                }) then
                                    lib.callback.await('dd5m_foodtrucks:server:handleCraft', false, b.ingredients, b.itemID, b.rewardCount, plate)
                                end
                                --Retrigger Menu
                                OpenCraftingMenu(entity, type)
                            end,
                        }
                    else
                        options[#options + 1] = {
                            title = b.menuLabel,
                            description = 'You are missing ingredients.',
                            image = 'nui://ox_inventory/web/images/'..b.itemID..'.png',
                            metadata = metadata,
                            onSelect = function()
                                OpenCraftingMenu(entity, type)
                            end
                        }
                    end
                end
            end
        end
        lib.registerContext({
            id = 'foodtruck_crafting',
            title = 'Food Truck',
            description = 'Lets make some magic!',
            canClose = false,
            menu = 'foodtruck_main_menu',
            options = options
        })
    end
    lib.showContext('foodtruck_crafting')
end

exports.ox_target:addGlobalVehicle({
    {
        name = 'open_foodtruck',
        icon = 'fa-solid fa-list-check',
        label = 'Food Truck',
        canInteract = function(entity, distance, coords, name, bone)
            local isWhitelisted = IsVehicleWhitelisted(entity)
            local vehPlate = GetVehicleNumberPlateText(entity)
            if isWhitelisted then
                local hasKitchen = lib.callback.await('dd5m_foodtrucks:server:hasKitchen', false, vehPlate)
                if hasKitchen then
                    local owner = IsOwner(entity)
                    local employee = IsEmployee(entity)
                    if owner or employee then
                        return true
                    end
                end
            end
        end,
        onSelect = function(data)
            OpenTruckMenu(data.entity)
        end,
    }
})

exports.ox_target:addGlobalVehicle({
    {
        name = 'open_counter',
        icon = 'fa-solid fa-utensils',
        label = 'Service Counter',
        canInteract = function(entity, distance, coords, name, bone)
            local isWhitelisted = IsVehicleWhitelisted(entity)
            local vehPlate = GetVehicleNumberPlateText(entity)
            if isWhitelisted then
                local hasKitchen = lib.callback.await('dd5m_foodtrucks:server:hasKitchen', false, vehPlate)
                return hasKitchen
            end
        end,
        onSelect = function(data)
            ox_inventory:openInventory('stash', {id='food_truck_counter'..GetVehicleNumberPlateText(data.entity)})
        end,
    }
})

exports('install', function(data, slot)
    local playerPed = cache.ped
    local playerCoords = GetEntityCoords(playerPed)
	if cache.vehicle then
        Alerts("You cannot do this in the vehicle!", 'error')
		return
    end

    local vehicle = lib.getClosestVehicle(playerCoords, 5.0, false)
    if IsVehicleWhitelisted(vehicle) then
        local engine = nil
        for i=1, #engines do
            local getEngineIndex = GetEntityBoneIndexByName(vehicle, engines[i])
            if getEngineIndex ~= -1 then
                engine = getEngineIndex
                break
            end
        end
        if #(playerCoords - GetWorldPositionOfEntityBone(vehicle, engine)) <= 2.3 then
            if DoesEntityExist(vehicle) then
                SetVehicleDoorOpen(vehicle, 4, 0, 0)
                TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                ox_inventory:useItem(data, function(data)
                    if lib.progressBar({
                        duration = shConfig.installTime,
                        label = 'Installing Kitchen Equipment',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                        },
                    }) then 
                        Wait(2000)
                        TriggerServerEvent("dd5m_foodtruck:server:kitchenAdd", GetVehicleNumberPlateText(vehicle), QBX.PlayerData.citizenid)
                        Alerts("Food kitchen installed.", 'info')
                        ClearPedTasksImmediately(playerPed)
                        SetVehicleDoorShut(vehicle, 4, 0)
                    else
                        ClearPedTasksImmediately(playerPed)
                    end
                end)
            end
        else
            Alerts("You are too far from engine!", 'error')
        end
    else
        Alerts("You cannot install a kitchen on this vehicle.", 'error')
    end
end)
