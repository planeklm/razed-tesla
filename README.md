# Tesla HUD by Razed
**Hello FiveM community!👋**\
We have created a simple Tesla inspired car HUD for any framework **(TESTED ONLY ON QBCORE)** which utilizes NUI.\
Just set your vehicle hash key into the config, and you now have a Tesla car HUD!

![RazedTeslaThumbnailNew](https://user-images.githubusercontent.com/91488137/197804626-d002a7be-5c90-4380-ad03-7c7fe507d9d4.png)

**Features:**

* Customizable
* Custom sounds
* Easy to configure


# Showcase
https://user-images.githubusercontent.com/91488137/197799802-880db875-8ca7-4214-9d43-9b7f09593f48.mp4

# Preview
![teslaExample](https://user-images.githubusercontent.com/91488137/197805932-0820c565-78d9-4765-8d40-73596f0ffadc.png)

# How To Install
* Drag and drop `razed-tesla`
* In your `server.cfg` add `ensure razed-tesla`
* In  `client.lua` change LegacyFuel to your fuel, or change its export.


# Config
```
Config = {}

Config.Setting = "KMH" -- This can either be KMH or MPH depending on your preference.
Config.Speed = "K" --  K = KMH  M = MPH

Config.FuelSetting = "LegacyFuel" -- This can be either 'LegacyFuel' or 'ps-fuel' or 'ox_fuel' depending on your preference.

Config.Teslas = {
    -429774847, -- Can be hash number
    `TESLA_MODEL_NAME_HERE` -- Or use jenkins hash
}
```

# Tebex
> https://razed.tebex.io/ - If you want to support me!
