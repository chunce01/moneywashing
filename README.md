# moneywashing
 Money washing script

 Money washing script utilizing QB-Target and a Ped.

Config.Bills allows you to define the payout for the item in this case "Markedbills"

Config.WashTime allows you to define in minutes the time till bills are cleaned.

Money can be stolen by other player requiring players to protect Johnny until he is done cleaning.


Required:
QBCore - https://github.com/qbcore-framework
QB-Target - https://github.com/BerkieBb/qb-target


-Ped Location put this in qb-Target config file.

 ['15'] = { 
     model = 'ig_hao',
     coords = vector4(203.54, 2465.09, 55.91, 78.51),
     minusOne = true, 
     freeze = true,
     invincible = true,
     blockevents = true,
     scenario = 'WORLD_HUMAN_AA_COFFEE',
     target = {
       options = {
         {
           type = "client", 
           event = "moneywashing:Menu",
           icon = "fas fa-hand-holding-usd",
           label = 'Johnny Tran',
           targeticon = 'fas fa-eye', 
         },
       },
       distance = 2.5,
     },
     currentpednumber = 0,
 },


