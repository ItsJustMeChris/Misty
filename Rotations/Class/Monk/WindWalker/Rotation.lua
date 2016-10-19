function WindWalker()
  --Start WindWalker rotation

  if inCombat and canCast(100780) and myChi <= 50 and targetHealth <= 100 then
    CastSpellByID(100780, "target")
  end

  --End WindWalker Rotation
end

