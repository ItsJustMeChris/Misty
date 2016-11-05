function getChi(unit)
if UnitIsVisible(unit) then
  return 100 * UnitPower(unit, 12)/UnitPowerMax(unit, 12)
end
end




--Returns my health and mana and if i'm in combat
myMana = getMana("player")
myHealth = getHealth("player")
myChi = getChi("player")
inCombat = UnitAffectingCombat("player")
--Returns target health (For Damage/Tank class)
targetHealth = getHealth("target")

function WindWalker()
  --Start WindWalker rotation

if inCombat and canCast(113656) and myChi == 60 and targetHealth <= 100 then
	CastSpellByID(113656, "target")
end

if inCombat and canCast(205320) and myChi == 40 and targetHealth <= 95 then
	CastSpellByID(205320, "target")
end

if inCombat and canCast(152175) and myChi == 40 and targetHealth <= 90 then
	CastSpellByID(152175, "target")
end

  if inCombat and canCast(100780) and myChi <= 80 and targetHealth <= 100 then
    CastSpellByID(100780, "target")
  end

    if inCombat and canCast(107428) and myChi <= 40 and targetHealth <= 94 then
    CastSpellByID(107428, "target")
  end




  --End WindWalker Rotation
end

