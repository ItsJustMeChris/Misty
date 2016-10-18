
function RotationStarter()
  local spec = GetSpecialization(select(2))
  local class = select(3, UnitClass("player"))

  if class == 10 and spec == 1 then
    BrewMaster();
  end
  if class == 10 and spec == 2 then
    MistWeaver();
  end
  if class == 10 and spec == 3 then
    WindWalker();
  end

  if not class == 10 then
    print("Rotation Not Implemented")
  end


end
