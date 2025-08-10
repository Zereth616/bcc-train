-- Your train definitions
-- Model Name of the Train - DO NOT CHANGE
-- Displayed Name of this Train
    -- Purchase Price for this Train
       -- Max Speed / *30 is Highest Game Allows*
      -- Set false to Disable Fuel Use
       -- Maximum Fuel Capacity
        -- Number of Items Needed to Fuel Train
       -- Time in Seconds to Decrease Fuel Level
       -- Amount of Fuel to Decrease


      -- Set false to Disable Condition Decrease
         -- Maximum Condition
          -- Number of Items Needed to Repair Train
          -- Time in Seconds to Decrease Condition Level
        -- Amount of Condition to Decrease
    
       -- Set to false to Disable Train Inventory
     -- Inventory can Hold Weapons
           -- Inventory is Shared with All Players
 
       -- Show Blip for Train Location
       -- Name of Blip on the Map
       -- Default: -250506368
      -- Color of Blip
Trains = {
    appleseed = {
        model = 'appleseed_config', -- keep as string key
        label = 'Appleseed',
        price = 150,
        maxSpeed = 15,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    },
    bountyhunter = {
        model = 'bountyhunter_config',
        label = 'Bounty Hunter',
        price = 175,
        maxSpeed = 20,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    },
    engine = {
        model = 'engine_config',
        label = 'Engine (No Cars)',
        price = 250,
        maxSpeed = 30,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    },
    gunslinger3 = {
        model = 'gunslinger3_config',
        label = 'Gunslinger 3',
        price = 175,
        maxSpeed = 20,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    }, 
    gunslinger4 = {
        model = 'gunslinger4_config',
        label = 'Gunslinger 4',
        price = 200,
        maxSpeed = 25,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    },
    prisoner = {
        model = 'prisoner_escort_config',
        label = 'Prisoner Escort',
        price = 100,
        maxSpeed = 10,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    },
    test = {
        model = 'east_config',
        label = 'Test',
        price = 100,
        maxSpeed = 10,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        },
    },
    winter4 = {
        model = 'winter4_config',
        label = 'Winter 4',
        price = 150,
        maxSpeed = 15,
        fuel = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        condition = {
            enabled = true,
            maxAmount = 100,
            itemAmount = 5,
            decreaseTime = 30,
            decreaseAmount = 5
        },
        inventory = {
            enabled = true,
            limit = 100,
            acceptWeapons = true,
            shared = true,
        },
        blip = {
            show = true,
            name = 'Train',
            sprite = -250506368,
            color = 'WHITE'
        }
    }
}
