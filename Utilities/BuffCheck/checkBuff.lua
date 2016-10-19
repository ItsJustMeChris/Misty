--Check the unit, ID for buff
--if checkBuff(lowestTarget, Enveloping_Mist) then do what you want end
function checkBuff(unit, ID)
  Buff = GetSpellInfo(ID)
  return UnitBuff(unit, Buff)
end