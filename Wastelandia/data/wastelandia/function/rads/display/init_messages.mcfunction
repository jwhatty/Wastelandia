# rads:display/init_messages.mcfunction
data merge storage wastelandia:messages { \
  norad: {msg:'[{"text":"[ ","color":"gray"},{"text":"☢ RADS: CLEAR","color":"aqua","bold":true},{"text":" ]","color":"gray"}]'}, \
  radgone: {msg:'[{"text":"[ ","color":"gray"},{"text":"☢ RADS: IMMUNE","color":"aqua","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"🛡 RAD-BE-GONE","color":"gold","bold":true,"italic":true},{"text":" ]","color":"gray"}]'}, \
  water: {msg:'[{"text":"☠ ","color":"dark_red"},{"text":"[ ","color":"gray"},{"text":"RADS: EXTREME","color":"dark_red","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: LIQUID","color":"red"},{"text":" ]","color":"gray"},{"text":" ☠","color":"dark_red"}]'}, \
  biome1: {msg:'[{"text":"☢ ","color":"red"},{"text":"[ ","color":"gray"},{"text":"RADS: EXTREME","color":"dark_red","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: AMBIENT","color":"red"},{"text":" ]","color":"gray"}]'}, \
  biome2: {msg:'[{"text":"☢ ","color":"gold"},{"text":"[ ","color":"gray"},{"text":"RADS: HIGH","color":"red","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: AMBIENT","color":"gold"},{"text":" ]","color":"gray"}]'}, \
  biome3: {msg:'[{"text":"☢ ","color":"yellow"},{"text":"[ ","color":"gray"},{"text":"RADS: LOW","color":"gold","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: AMBIENT","color":"yellow"},{"text":" ]","color":"gray"}]'}, \
  biome4: {msg:'[{"text":"🛡 ","color":"green"},{"text":"[ ","color":"gray"},{"text":"RADS: NONE","color":"green","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: AMBIENT","color":"dark_green"},{"text":" ]","color":"gray"}]'}, \
  mutant1: {msg:'[{"text":"☣ ","color":"red"},{"text":"[ ","color":"gray"},{"text":"RADS: EXTREME","color":"dark_red","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: MUTANT","color":"red"},{"text":" ]","color":"gray"}]'}, \
  mutant2: {msg:'[{"text":"☣ ","color":"gold"},{"text":"[ ","color":"gray"},{"text":"RADS: HIGH","color":"red","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: MUTANT","color":"gold"},{"text":" ]","color":"gray"}]'}, \
  mutant3: {msg:'[{"text":"☣ ","color":"yellow"},{"text":"[ ","color":"gray"},{"text":"RADS: LOW","color":"gold","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: MUTANT","color":"yellow"},{"text":" ]","color":"gray"}]'}, \
  mutant4: {msg:'[{"text":"🛡 ","color":"green"},{"text":"[ ","color":"gray"},{"text":"RADS: NONE","color":"green","bold":true},{"text":" ] - [ ","color":"gray"},{"text":"SOURCE: MUTANT","color":"dark_green"},{"text":" ]","color":"gray"}]'} \
}
