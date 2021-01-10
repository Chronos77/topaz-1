-----------------------------------
-- tpz.effect.DRAIN_DAZE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ENSPELL_DMG, 0)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:setMod(tpz.mod.ENSPELL_DMG, 0)
end

return effect_object
