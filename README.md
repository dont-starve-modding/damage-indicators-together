# Damage Indicators Together

/ˈdæm.ætʒ ˈɪn.dɪ.keɪ.torz/

Such Red. Less Green. Much ouch. So Bääääm. WOW

### Damage Indicators are over 9000!!

(Oh yeah.. nearly forgot: get this mod to display cool fancy numbers on top of the heads of monsters you are just smashing)

### Configuration-Options:

- Only show damage: No heal.
- Display mode: 'Straight' for OCD-Version.
- Amount of numbers: Low for number-hell if you freeze.
- Decimal points: "1.3333", "1.3" or simply "1"
- Number size

#### This is the DST-version. This is _not_ a client-only mod. It's a Server _and_ Client mod.

Special thanks to DarkXero for porting this mod to DST! ([profile](http://forums.kleientertainment.com/user/537485-darkxero/]))

### Development

Just do what you think is right. "Build" the mod by running `./build-and-copy.sh` in a Shell or Git Bash. You may have to adjust the target path in `copy.sh` to work properly, depending on your operating system and installation path.

### Delivery

Run Don't Starve Mod Uploader from Steam, choose Edit, then "Update Data". Choose the path chosen in `./copy.sh` plus `build-damage`. (e.g. `C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\mods\build-damage` on Windows)

### FAQ

#### The numbers are too large. What can I do?

Change the settings "Number size" to "Tiny"

#### Something is not working as expected. Where can I submit an error?

Here: https://github.com/dont-starve-modding/damage-indicators-together/issues/new

#### Sometimes I see 0 or 0.0 when being healed or damaged. Is this correct?

It can happen that the actual value of healing or damage can be rounded down to 0. So you can assume that the dealt damage or applied healing is: |x| < 0.5

### Steam

http://steamcommunity.com/sharedfiles/filedetails/?id=220511926

Requested by: [HexicTheory](http://forums.kleientertainment.com/topic/58723-requesthelp-porting-ds-mod-to-dst/)

### More links:

Originally created [here](http://forums.kleientertainment.com/files/file/439-damage-indicators/)

Damage Indicators for Single Player: [Damage Indicators](http://steamcommunity.com/sharedfiles/filedetails/?id=220511926&searchtext=Damage)
