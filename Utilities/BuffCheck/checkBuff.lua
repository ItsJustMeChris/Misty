--Check the unit, ID for buff
--if checkBuff(lowestTarget, Enveloping_Mist) then do what you want end
function checkBuff(unit, ID)
  Buff = GetSpellInfo(ID)
  if UnitAura(unit, ID, "", "player") then
  	print("has buff")
  	return true
  else
  return false
end
end