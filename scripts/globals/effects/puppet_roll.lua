-----------------------------------
-- tpz.effect.PUPPET_ROLL
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

function onEffectGain(target, effect)
    target:addPetMod(tpz.mod.MATT, effect:getPower())
    target:addPetMod(tpz.mod.MACC, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delPetMod(tpz.mod.MATT, effect:getPower())
    target:delPetMod(tpz.mod.MACC, effect:getPower())
end

return effect_object
