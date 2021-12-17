-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

-- Zarstia adding onInit function
function onInit()
	onSubwindowModeChanged();
end

function onDisplayChanged()
	if not minisheet then
		for _,v in pairs(actions.subwindow.spellclasslist.getWindows()) do
			v.onDisplayChanged();
		end
	end
end

-- Zarestia adding onSubwindowModeChanged function
function onSubwindowModeChanged()
	local bPrepMode = DB.getValue(getDatabaseNode(), "spellmode", "");
	if bPrepMode == "combat" then
		actions_am.setStaticBounds(23,0,-29,130);
		actions_am.setVisible(true);
	else
		actions_am.setStaticBounds(0,0,0,0);
		actions_am.setVisible(false);
	end
end

function onModeChanged()
	if minisheet then
		weaponlist.onModeChanged();
	else
		actions.subwindow.weaponlist.onModeChanged();
	end
	
	-- Zarestia adding onSubwindowModeChanged function
	onSubwindowModeChanged();
	
	updateSpellCounters();
end

function updateSpellCounters()
	if minisheet then
		for _,v in pairs(spellclasslist.getWindows()) do
			v.onSpellCounterUpdate();
		end
	else
		for _,v in pairs(actions.subwindow.spellclasslist.getWindows()) do
			v.onSpellCounterUpdate();
		end
	end
end