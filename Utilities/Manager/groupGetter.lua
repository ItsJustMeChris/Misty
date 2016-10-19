--Gets the party/party type and sorts them by health.
function getGroup()
  local groupType = IsInRaid() and "raid" or "party";
  Group.party = {}
  table.insert(Group.party,{Unit="player",HP=getHealth("player")})
  for i=1, GetNumGroupMembers() do
    local Unit = (groupType .. i)
    if UnitIsVisible(Unit) then
      table.insert(Group.party, {Unit = Unit,HP=getHealth(Unit)})
    end
  end
  table.sort(Group.party, function(low,high) return low.HP < high.HP end)
  return Group.party
end

--Should get tank but it's broken
function getTank()
  local groupType = IsInRaid() and "raid" or "party";
  local playerType = UnitGroupRolesAssigned(unit)
  Group.tank = {}
  for i=1, GetNumGroupMembers() do
    local UnitTank = (groupType .. i)
    if UnitIsVisible(unit) and playerType == "TANK" then
      table.insert(Group.tank, {UnitTank,HP=getHealth(Unit)})
    end
  end
  table.sort(Group.tank, function(low,high) return low.HP < high.HP end)
  return Group.tank
end

--Should get healer but its broeken
function getHealer()
  local groupType = IsInRaid() and "raid" or "party";
  local playerType = UnitGroupRolesAssigned(unit)
  Group.healer = {}
  for i=1, GetNumGroupMembers() do
    local UnitHealer = (groupType .. i)
    if UnitIsVisible(unit) and playerType == "HEALER" then
      table.insert(Group.healer, {UnitHealer,HP=getHealth(unit)})
    end
  end
  table.sort(Group.healer, function(low,high) return low.HP < high.HP end)
  return Group.healer
end