# bcc-train

## Description
This is the best, full fledged train script for RedM! A multitude of features like built in track switching, train inventories, ownership and more!
Updated with more advanced features - Some trains don't like the new interiors but its only a handful out of the 50+ you can use. 

## Features
- Buy and Sell trains at the train stations
- Track Switching
- Multiple train stations
- Station access can be limited by job and jobgrade
- Station hours may be set individually for each station or disabled to allow the station to remain open
- Purchased trains are stored in the database
- Can set a max number of trains a player can own
- Individual inventory size for each train model
- Config option to allow cruise control
- Configurable train speeds
- Trains need fuel to run
- Maintain the train to keep it functional
- Station blips are colored and changeable per stable location
- Blips can change color reflecting if station is open, closed or job locked
- Webhooks
- Distance-based NPC spawns
- Server-based delivery cooldown (persists through client relog)
- Exports for developers to use
- Train Hash
0x005E03AD
0x0392C83A
0x0660E567
0x0941ADB7 - net_fetch_train_vip_rescue_00
0x09B679D6
0x0CCC2F70
0x0D03C58D
0x0E62D710 - ghost_train_config
0x10461E19
0x124A1F89
0x19A0A288
0x1C043595
0x1C9936BB
0x1EEC5C2A
0x1EF82A51
0x25E5D8FF
0x26509FBB - dummy_engine_config
0x29C81ACB
0x2D1A6F0C
0x2D3645FA
0x31656D23
0x3260CE89 - engine_config
0x35D17C43
0x3ADC4DA9
0x3D72571D - gunslinger3_config
0x3EDA466D - handcart_config
0x41436136
0x487B2BE7 - winter4_config
0x4A73E49C
0x4C9CCB22
0x515E31ED - prisoner_escort_config
0x57C209C4
0x592A5CD0
0x5AA369CA - gunslinger4_config
0x5D9928A4
0x68CF495F
0x6CC26E27
0x6D69A954
0x73722125
0x761CE0AD - net_fetch_train_camp_resupply_00
0x767DEB32 - industry2_config
0x7BD58C4D
0x8864D73A
0x8D0766BC
0x8EAC625C - appleseed_config
0x90CB53CA
0x9296570E
0x96563327
0x98427740
0x9897FF51
0x998A0CBC
0x9CBE6FEC
0x9E096E46
0xA3BF0BEB - net_fetch_train_kidnapped_buyer_00
0xA8B1CEB7
0xA91041A2
0xAA3E691E
0xAC18A9F4
0xAE47CA77 - net_fetch_train_bounty_horde_00
0xAEE0ECF5
0xB1F69614
0xBF69518F - trolley_config
0xC1F1DD80
0xC732CDC8
0xC75AA08C - minecart_config
0xCA19C62A
0xCD2C7CA1
0xD233B18D - net_fetch_train_moving_bounty_1
0xD42DD3EE
0xD5DF2D82
0xD8CF6395
0xD92B16AE
0xD93C36C2
0xDA2EDE2F
0xDC9DD041
0xDD920DAF
0xE0898B89
0xE16CA3EF
0xEB8B2439
0xEF9FC71D
0xEFBFBDD8
0xF19E48CA
0xF6AA98F4
0xF9B038FC - bountyhunter_config
0xFAB2FFB9
0xFAC328F0
0xFD8810E8

## Dependencies
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua)
- [bcc-minigames](https://github.com/BryceCanyonCounty/bcc-minigames)
- [bcc-utils](https://github.com/BryceCanyonCounty/bcc-utils)

## Installation
- Download the latest release `bcc-train.zip` at [/releases/latest](https://github.com/BryceCanyonCounty/bcc-train/releases/latest)
- Add `bcc-train` folder to your resources folder
- Add `ensure bcc-train` to your `resources.cfg`
- Run the included database file `train.sql`
- Add images to: `...\vorp_inventory\html\img`
- Make sure dependencies are ensured above `bcc-train`
- Restart server

## How to use
- To refuel/repair train hold right click while near the driver seat to show prompts
- Press `U` to access train inventory
- Cruise control will disengage if conductor leaves engine seat
- Buy a train from a station, spawn it and have fun!
- Add any train hash in the client.lua to use just make sure the modelhash corresponds to the one in the trains config 

## Api
### Check if train spawned! (Server Side Use only)
- Returns true if a train has been spawned false if no train is spawned/in-use. Only 1 train should be spawned at a time on a server typically.
```Lua
local retval = exports['bcc-train']:CheckIfTrainIsSpawned()
```

### Get Train Entity (Server Side Use Only)
- If a train exists, this returns the train entity to be used on the client side, returns false if no train is spawned/in-use.
```Lua
local retval = exports['bcc-train']:GetTrainEntity()
```

## Credits and Notes
- All imagery was provided by Lady Grey our in house designer
- Thanks sav for the nui
- Images for items can be found under the imgs/itemImages folder

## GitHub

- https://github.com/BryceCanyonCounty/bcc-train




