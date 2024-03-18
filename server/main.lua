local hasKitchen = {}
local tempEmployees = {}
local truckOwner = {}
local ox_inventory = exports.ox_inventory

function Alerts(source, text, type)
    -- --Insert Custom Notification String
    lib.notify(source, {title = 'Food Trucks', description = text, type = type, duration = 5000}) 
    -- --Insert Custom Notification String
end

CreateThread(function()
    Wait(1000)
    MySQL.query('SELECT plate, citizenid FROM player_vehicles WHERE foodtruck = ?', {'1'}, function(result)
            if #result > 0 then
            for i=1, #result do
                hasKitchen[result[i].plate] = true
                tempEmployees[result[i].plate] = {}
                truckOwner[result[i].plate] = result[i].citizenid
                ox_inventory:RegisterStash('food_truck_stash'..result[i].plate, 'Cooking Stash', 200, 50000, false)
                ox_inventory:RegisterStash('food_truck_safe'..result[i].plate, 'Truck Safe', 50, 50000, false)
                ox_inventory:RegisterStash('food_truck_counter'..result[i].plate, 'Service Counter', 50, 50000, false)
            end
        end
    end)
end)

RegisterNetEvent('dd5m_foodtruck:server:kitchenAdd', function(plate, citizenid)
    hasKitchen[plate] = true
    tempEmployees[plate] = {}
    truckOwner[plate] = citizenid

    MySQL.update('UPDATE player_vehicles SET foodtruck = 1 WHERE plate = @plate',{
        ['@plate'] = plate,
    })
    ox_inventory:RegisterStash('food_truck_stash'..plate, 'Cooking Stash', 200, 50000, false)
    ox_inventory:RegisterStash('food_truck_safe'..plate, 'Truck Safe', 50, 50000, false)
    ox_inventory:RegisterStash('food_truck_counter'..plate, 'Service Counter', 50, 50000, false)
end)

lib.callback.register('dd5m_foodtrucks:server:hasKitchen', function(source, plate)
    local result = hasKitchen[plate]
    return result
end)

lib.callback.register('dd5m_foodtrucks:server:stashCount', function(source, item, plate)
    return ox_inventory:Search('food_truck_stash'..plate, 'count', item)
end)

lib.callback.register('dd5m_foodtrucks:server:getOwner', function(source, plate)
    local owner = nil
    if truckOwner[plate] ~= nil then return truckOwner[plate] end
    MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
        if #result > 0 then
            for i=1, #result do
                owner = result[i].citizenid
            end
        end
    end)
    Wait(100)
    table.insert(truckOwner[plate], owner)
    return owner
end)

lib.callback.register('dd5m_foodtrucks:server:handleCraft', function(source, ingredients, reward, count, plate)
    local success = nil
    for k, v in pairs(ingredients) do
        success = ox_inventory:RemoveItem('food_truck_stash'..plate, v.item, v.count)
        if not success then Alerts(source, 'Failed to remove ingredients.', 'error') return end
    end
    local itemAdded = ox_inventory:AddItem('food_truck_counter'..plate, reward, count)
    if itemAdded then Alerts(source, 'Order on the counter!', 'info') end
end)

lib.callback.register('dd5m_foodtrucks:server:getEmployees', function(source, plate)
    return tempEmployees[plate]
end)

RegisterServerEvent('dd5m_foodtrucks:server:handleEmployee', function(plate, empId, task)
    if task == 'insert' then
        if table.find(tempEmployees[plate], empId) then
            Alerts(source, 'Already hired!', 'error')
            return
        end
        table.insert(tempEmployees[plate], empId)
        Alerts(source, 'Employee hired!', 'info')
    elseif task == 'remove' then

        table.remove(tempEmployees[plate], 1)
        Alerts(source, 'Employee released!', 'info')
    end
end)