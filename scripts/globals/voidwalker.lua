-----------------------------------
-- The Voidwalker NM System
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/settings")

tpz = tpz or {}
tpz.voidwalker = tpz.voidwalker or {}

local abyssite_Keyitems = {
    [9] = tpz.keyItem.BLACK_ABYSSITE,
    [8] = tpz.keyItem.GREY_ABYSSITE,
    [7] = tpz.keyItem.PURPLE_ABYSSITE,
    [6] = tpz.keyItem.YELLOW_ABYSSITE,
    [5] = tpz.keyItem.BROWN_ABYSSITE,
    [4] = tpz.keyItem.ORANGE_ABYSSITE,
    [3] = tpz.keyItem.BLUE_ABYSSITE,
    [2] = tpz.keyItem.COLORFUL_ABYSSITE,
    [1] = tpz.keyItem.CLEAR_ABYSSITE,
}

local function getCurrentKIsFromPlayer(player)
    local results = 0
    local count = 8
    for i, keyitem in ipairs(abyssite_Keyitems) do 
        local currentBit = 0
        if player:hasKeyItem(keyitem) then
            currentBit = 1
        end
        results = results + bit.lshift(currentBit, i - 1)
    end
    return results
end

-- 
-- NPC Assai Nybaem
-- 
tpz.voidwalker.npcOnTrigger = function(player, npc)
    if ENABLE_ABYSSEA ~= 1 then
        return
    end

    local currentKIS = getCurrentKIsFromPlayer(player)
    player:startEvent(10120, currentKIS)
end

tpz.voidwalker.npcOnEventUpdate = function(player, csid, option)
end

tpz.voidwalker.npcOnEventFinish = function(player, csid, option)
    local opt = bit.band(option, 0xF)
    if csid == 10120 and opt == 3 then
        local msg = require("scripts/zones/RuLude_Gardens/ID")
        local ki = abyssite_Keyitems[1]
        player:delGil(1000)
        player:addKeyItem(ki)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, ki)
    elseif csid == 10120 and opt == 2 then
        local numAbyssite = bit.rshift(option, 4)
        player:delKeyItem(abyssite_Keyitems[numAbyssite])
    end
end

--
-- onHealing : trigg when player /heal
--

tpz.voidwalker.onHealing = function(player)
    if ENABLE_ABYSSEA ~= 1 then
        return
    end
    local ID = zones[player:getZoneID()]


end