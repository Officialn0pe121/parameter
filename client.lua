local QBCore = exports['qb-core']:GetCoreObject()

-- this is a global function meaning you can use this anywhere
-- message will contain a string holding whatever we assign it to from the function CALL
-- title will contain a string holding whatever we assign it to from the function CALL
-- time will contain an int holding whatever we assign it to from the function CALL
-- MAKE SURE THIS IS DECLARED BEFORE THE CALL OR IT WILL BE A NIL FUNCTION!!
function DoSomething(message, title, time)
    print(message .. title .. tostring(time)) -- This will print the values of message, title, time. --any int or float values must be converted to strings or fivem cries for some reason :shrug:
end

-- this is a local function meaning you can only use this within this file
-- this is the function where we send our values to the print function
-- when calling the function you want to send values to keep the order the same in both the call and declaration
-- make sure you assign the right type of variable in this function otherwise it wont work properly in the print function
local AssignValues = function()
    local stringvar = "this is the value of \"message\""
    local stringvar2 = "this is the value of \"title\""
    local timevar = 12
    DoSomething(stringvar, stringvar2, timevar) -- names dont matter as we assign the values to a local variable within the declaration
end

-- same syntax rules apply to client and server events as functions
-- parameters are different values from the function above even though they are the same variables since they are local vars
-- order does matter in this case otherwise values will be assigned in the order they are called in, I believe, take that with a grain of salt though
-- again, must declare this before using a tiggerevent on it or it will be a nil event
RegisterNetEvent("SomeClientEvent:client:SomeClientEventTitle", function(message, title, time)
    print(message .. title .. tostring(time)) -- This will print the values of message, title, time. --any int or float values must be converted to strings or fivem cries for some reason :shrug:
end)

-- this is a local function meaning you can only use this within this file
-- no parameters are needed yet since this is the call to assign values and call the function to print values
-- when calling the function you want to send values to keep the order the same in both the call and declaration
-- make sure you assign the right type of variable in this function otherwise it wont work properly in the print function
local AssignValuesToNetEvent = function()
    local stringvar = "this is the value of \"message\""
    local stringvar2 = "this is the value of \"title\""
    local timevar = 12
    TriggerEvent("SomeClientEvent:client:SomeClientEventTitle", stringvar, stringvar2, timevar) -- names dont matter as we assign the values to a local variable within the declaration
end

RegisterCommand('parametertest', function()
    AssignValues()
end)

RegisterCommand('parametertest2', function()
    AssignValuesToNetEvent()
end)
