-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Magian Moogle (Green Bobble)
-- Type: Magian Trials NPC (Job Emotes)
-- !pos -4.558 2.451 111.305 64
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/magiantrials")
-----------------------------------
local entity = {}
local EVENT_IDS = {
    [3]  = 10152,
    [4]  = 10153,
    [6]  = 10158,
    [10] = 10151,
    [11] = 10160,
}

entity.onTrade = function(player, npc, trade)
    if ENABLE_MAGIAN_TRIALS ~= 1 then
        return
    end
    tpz.magian.magianOnTrade(player, npc, trade, tpz.itemType.ARMOR, EVENT_IDS)
end

entity.onTrigger = function(player, npc)
    if ENABLE_MAGIAN_TRIALS ~= 1 then
        return
    end

    tpz.magian.magianOnTrigger(player, npc, EVENT_IDS)
end

entity.onEventUpdate = function(player,csid,option)
    tpz.magian.magianEventUpdate(player, itemId, csid, option, EVENT_IDS)
end

entity.onEventFinish = function(player,csid,option)
    tpz.magian.magianOnEventFinish(player, itemId, csid, option, EVENT_IDS)
end

return entity
