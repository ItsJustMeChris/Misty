function RotationStarter()
  --Checks spec of Player and class of player
  local spec = GetSpecialization(select(2))
  local class = select(3, UnitClass("player"))
  --If you're a BrewMaster Monk then load BrewMaster
  if class == 10 and spec == 1 then
    BrewMaster();
  end
  --If you're a MistWeaver Monk then load MistWeaver
  if class == 10 and spec == 2 then
    MistWeaver();
  end
  --If you're a WindWalker Monk then load WindWalker
  if class == 10 and spec == 3 then
    WindWalker();
  end
  --If you're a not a Monk then class not implemented
  if not class == 10 then
    print("Rotation Not Implemented")
  end
end
