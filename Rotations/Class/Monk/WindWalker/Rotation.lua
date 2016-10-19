function WindWalker()

  function inRange()
    if UnitIsInRange == true then
      return true
    else return false
    end
  end

  function getChi(unit)
    if UnitIsVisible(unit) then
      return 100 * UnitPower(unit, 12)/UnitPowerMax(unit, 12)
    end


  end
  targetHealth = getHealth("target")
  myChi = getChi("player")

  inCombat = UnitAffectingCombat("player")

  if inCombat and canCast(100780) and myChi <= 50 and targetHealth <= 100 then
    CastSpellByID(100780, "target")
  end

end

