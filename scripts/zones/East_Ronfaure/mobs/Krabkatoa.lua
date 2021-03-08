-----------------------------------
-- Area: East Ronfaure
--  VNM: Krabkatoa
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/voidwalker")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    tpz.voidwalker.mobOnInit(mob)
end

entity.onMobSpawn = function(mob)
    tpz.voidwalker.mobOnSpawn(mob)
end

entity.onMobDeath = function(mob, player, isKiller)
    player:addTitle(tpz.title.KRABKATOA_STEAMER)
    tpz.voidwalker.mobOnDeath(mob, player, isKiller)
end

return entity
