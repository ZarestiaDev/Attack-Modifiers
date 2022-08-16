-- 
-- Please see the license.txt file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	local _tAMModifierExclusionSet =
	{
		{ "DEF_SHOOTMELEE", "ATT_FLANK"},
		{ "DEF_SHOOTMELEE", "ATT_CHARGE"},
		{ "DEF_SHOOTMELEE", "ATT_HIGHGROUND"},
		{ "DEF_SHOOTMELEE", "DEF_NONLETHAL"},
	}

	ModifierManager.addKeyExclusionSets(_tAMModifierExclusionSet)
	ActionsManager.registerModHandler("attack", modAttackCustom);
end

function modAttackCustom(rSource, rTarget, rRoll)
	
	local aAddDesc = {};
	local nAddMod = 0;

	ActionAttack.modAttack(rSource, rTarget, rRoll);
	
	local bFlank = ModifierManager.getKey("ATT_FLANK");
	local bCharge = ModifierManager.getKey("ATT_CHARGE");
	local bHighGround = ModifierManager.getKey("ATT_HIGHGROUND");
	local bDefFighting = ModifierManager.getKey("DEF_FIGHTING");
	local bNonLethal = ModifierManager.getKey("DEF_NONLETHAL");
	local bShootMelee = ModifierManager.getKey("DEF_SHOOTMELEE");
	
	local meleeAttack = string.match(rRoll.sDesc, "%(M%)")
	local rangedAttack = string.match(rRoll.sDesc, "%(R%)")

	if meleeAttack then
		bShootMelee = false
	elseif rangedAttack then
		bFlank = false
		bCharge = false
		bHighGround = false
		bNonLethal = false
	end

	if bFlank then
		table.insert(aAddDesc, "[FLANKING +2]");
		nAddMod = nAddMod + 2;
	end

	if bCharge then
		table.insert(aAddDesc, "[CHARGE +2]");
		nAddMod = nAddMod + 2;
	end

	if bHighGround then
		table.insert(aAddDesc, "[HIGH GROUND +1]");
		nAddMod = nAddMod + 1;
	end

	if bNonLethal then
		table.insert(aAddDesc, "[NON LETHAL -4]");
		nAddMod = nAddMod - 4;
	end

	if bDefFighting then
		table.insert(aAddDesc, "[DEFENSIVE FIGHTING -4]");
		nAddMod = nAddMod - 4;
	end

	if bShootMelee then
		table.insert(aAddDesc, "[SHOOT MELEE -4]");
		nAddMod = nAddMod - 4;
	end
	
	if #aAddDesc > 0 then
		rRoll.sDesc = rRoll.sDesc .. " " .. table.concat(aAddDesc, " ");
	end
	rRoll.nMod = rRoll.nMod + nAddMod;
end
