-----------------------------------
-- The Voidwalker NM System
-----------------------------------
require("scripts/globals/keyitems")

tpz = tpz or {}
tpz.voidwlaker = tpz.voidwlaker or {}

local function getCurrentKIs(player)
    results = 0
    for i=tpz.keyitems.BLACK_ABYSSITE, tpz.keyitems.CLEAR_ABYSSITE, -1 do
        local currentBit = 0
        if player:hasKeyItem(i) then
           currentBit = 1
        end
        results = bit.lshift(results, 0) + currentBit
    end
    return results
end

tpz.voidwlaker.npcOnTrigger = function(player, npc)
    local kis = getCurrentKIsFromPlayer(player)
    printf("kisBits : %i ", kis)
    player:startEvent(10120)
end

tpz.voidwlaker.npcOnEventUpdate = function(player, csid, option)
    printf("csid: %i ", csid)
    printf("option: %i ", option)
end

tpz.voidwlaker.npcOnEventFinish = function(player, csid, option)
    printf("csid: %i ", csid)
    printf("option: %i ", option)
end