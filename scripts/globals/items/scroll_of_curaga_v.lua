-----------------------------------------
-- ID: 4619
-- Scroll of Curaga V
-- Teaches the white magic Curaga V
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(11)
end

function onItemUse(target)
    target:addSpell(11)
end
