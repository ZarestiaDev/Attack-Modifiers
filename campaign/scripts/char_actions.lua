-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

-- Zarstia adding onInit function
function onInit()
	local sExtensions = ExtensionName.getExtensionName();
	if string.find(sExtensions, "Extra Actions") then
		actions_am.setAnchor("top", "shortcutframe", "bottom");
	end

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
		actions_am.setAnchor("left", "", "left", "", 23);
		actions_am.setAnchoredWidth(-29);
		actions_am.setAnchoredHeight(130);
		actions_am.setVisible(true);
	else
		actions_am.setAnchoredWidth(0);
		actions_am.setAnchoredHeight(0);
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