-----------------------------------
-- The Voidwalker NM System
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/zone")

tpz = tpz or {}
tpz.voidwalker = tpz.voidwalker or {}

local abyssiteKeyitems = {
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

local posUsed = {}

local voidwalkerPos = {
    [tpz.zone.EAST_RONFAURE] = {
        [1] = { 374, -45, 138 },
        [2] = { 466, -45, 140 },
        [3] = { 469, -35, 21 },
        [4] = { 381, -36, 14 },
        [5] = { 299, -39, -23 },
        [6] = { 313, -29, -98 },
        [7] = { 447, -26, -69 },
        [8] = { 485, -20, -137 },
        [9] = { 495, -18, -251 },
        [10] = { 389, -16, -337 },
        [11] = { 348, 0, -478 },
        [12] = { 546, -7, -401 },
        [13] = { 614, -10, -472 },
        [14] = { 479, -59, 430 },
        [15] = { 268, -59, 445 },
        [16] = { 379, -16, -112 },
        [17] = { 167, -20, -112 },
        [18] = { 126, -30, -31 },
        [19] = { 86, -49, 111 },
        [20] = { 266, -48, 252 },
    }
}


local function getCurrentKIsFromPlayer(player)
    local results = 0
    local count = 8
    for i, keyitem in ipairs(abyssiteKeyitems) do 
        local currentBit = 0
        if player:hasKeyItem(keyitem) then
            currentBit = 1
        end
        results = results + bit.lshift(currentBit, i - 1)
    end
    return results
end

local function setRandomPos(mob)
    local zoneId = mob:getZone():getID()
    local pos = math.random(1, table.getn(voidwalkerPos[zoneId]))
    if posUsed[zoneId] == nil then
        posUsed[zoneId] = {}
    elseif posUsed[zoneId][pos] ~= nil then
        repeat
            pos = math.random(1, table.getn(voidwalkerPos[zoneId]))
        until posUsed[zoneId][pos] ~= nil
    end
    posUsed[zoneId][pos] = { mobId=mob:getID(), keyItem=ki }
    local vPos = voidwalkerPos[zoneId][pos]
    printf("zoneid: %i, mobid: %i, vposx %i, vposy %i, vposz %i",zoneId, mob:getID(),vPos[1],vPos[2],vPos[3])
    mob:setSpawn(vPos[1], vPos[2], vPos[3])
    SpawnMob(mob:getID())
end

-- 
-- NPC Assai Nybaem
-- 
tpz.voidwalker.npcOnTrigger = function(player, npc)
    if ENABLE_VOIDWALKER ~= 1 then
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
        local ki = abyssiteKeyitems[1]
        player:delGil(1000)
        player:addKeyItem(ki)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, ki)
    elseif csid == 10120 and opt == 2 then
        local numAbyssite = bit.rshift(option, 4)
        player:delKeyItem(abyssiteKeyitems[numAbyssite])
    end
end

--
-- Mob On Init
--
tpz.voidwalker.mobOnInit = function(mob)
    -- mob:setStatus(tpz.status.INVISIBLE)
    -- voir comment ne pas le widescanner
end

tpz.voidwalker.mobOnSpawn = function(mob)
    -- retirer sa pos de posUsed
    -- randomiser l'augment de l'abyssite
    setRandomPos(mob)
end

tpz.voidwalker.mobOnDeath = function(mob)
    -- retirer sa pos de posUsed
    -- randomiser l'augment de l'abyssite 
end

--
-- onHealing : trigg when player /heal
--
tpz.voidwalker.onHealing = function(player)
    if ENABLE_VOIDWALKER ~= 1 then
        return
    end
    local ID = zones[player:getZoneID()]


end