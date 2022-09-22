TOP_BOUND = 15;

function onInit()
	if CompManagerAM.EXTENSIONS["Advanced Charsheet"] then
    	OptionsManager.registerCallback("ACAT", stateChanged);

    	stateChanged();
	end

	resetAttackModifiers();
end

function onClose()
	if CompManagerAM.EXTENSIONS["Advanced Charsheet"] then
    	OptionsManager.unregisterCallback("ACAT", stateChanged);
	end
end

function stateChanged()
	self.resetAnchor("top");
	self.resetAnchor("left");
	self.resetAnchor("right");
	self.resetAnchor("bottom");
	self.setAnchor("left", "leftanchor", "right", "relative", 15);
	self.setAnchor("top", "leftanchor", "bottom", "", 5);
	if OptionsManager.isOption("ACAT", "on") then
		TOP_BOUND = 47;
	else
		TOP_BOUND = 15;
	end

	onValueChanged();
end

function onValueChanged()
	if getValue() == 1 then
		window.actions_am.setVisible(true);
		window.actions_am.setStaticBounds(23,TOP_BOUND,-29,130);
	else
		resetAttackModifiers();
	end
end

function resetAttackModifiers()
	local am = window.actions_am.subwindow;
    window.actions_am.setVisible(false);
	window.actions_am.setStaticBounds(0,0,0,TOP_BOUND);
	
	am.ATT_FLANK.setValue(0);
	am.ATT_CHARGE.setValue(0);
	am.ATT_HIGHGROUND.setValue(0);
	am.DEF_PCOVER.setValue(0);
	am.DEF_NONLETHAL.setValue(0);
	am.DEF_SHOOTMELEE.setValue(0);
	am.DEF_FIGHTING.setValue(0);
	am.DEF_COVER.setValue(0);
	am.ATT_TCH.setValue(0);
	am.DEF_CONC.setValue(0);
	am.DEF_TCONC.setValue(0);
	am.DEF_SCOVER.setValue(0);
end
