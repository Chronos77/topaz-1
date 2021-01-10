-----------------------------------
-- tpz.effect.ELEMENTAL_SEAL
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
   target:addMod(tpz.mod.MACC, 256)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MACC, 256)
end

return effect_object
