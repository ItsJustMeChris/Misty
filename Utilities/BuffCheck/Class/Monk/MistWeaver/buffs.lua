function checkBuff(unit, ID)
  Buff = GetSpellInfo(ID)
  return UnitBuff(unit, Buff)
end