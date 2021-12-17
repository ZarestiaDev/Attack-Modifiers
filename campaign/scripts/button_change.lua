local _sKey = nil;

function onInit()
	changeThemeButtons();
	setData(getName());
end

function onClose()
	clearData();
end

function getData()
	return _sKey;
end

function setData(sKey)
	clearData();

	if ModifierManager.getRawKey(sKey) then
		setValue(1);
	end
	_sKey = sKey;

	addCallback();
end

function clearData()
	if _sKey then
		removeCallback();
		_sKey = nil;
	end
end

function addCallback()
	if _sKey then
		ModifierManager.registerKeyCallback(_sKey, onPresetChanged);
	end
end

function removeCallback()
	if _sKey then
		ModifierManager.unregisterKeyCallback(_sKey, onPresetChanged);
	end
end

local _bCallbackChangeLock = false;
function onPresetChanged()
	if _bCallbackChangeLock then
		return;
	end
	_bCallbackChangeLock = true;
	if ModifierManager.getRawKey(_sKey) then
		setValue(1);
	else
		setValue(0);
	end
	_bCallbackChangeLock = false;
end

function onButtonPress()
	if _bCallbackChangeLock then
		return;
	end
	_bCallbackChangeLock = true;

	if _sKey then
		if getValue() > 0 then
			ModifierManager.setKey(_sKey, true);
		else
			ModifierManager.setKey(_sKey, false);
		end
	end
	_bCallbackChangeLock = false;
end

function changeThemeButtons()
	local bThemeName = ExtensionName.getExtensionName();
	
	if bThemeName == "Theme: FG Dark" then
		setStateIcons(0, "dark_buttonup_am");
		setStateIcons(1, "dark_buttondown_am");
	elseif bThemeName == "Theme: FG Futuristic" then
		setStateIcons(0, "futuristic_buttonup_am");
		setStateIcons(1, "futuristic_buttondown_am");
	elseif bThemeName == "Theme: FG Light" then
		setStateIcons(0, "light_buttonup_am");
		setStateIcons(1, "light_buttondown_am");
	elseif bThemeName == "Theme: FG Modern" then
		setStateIcons(0, "modern_buttonup_am");
		setStateIcons(1, "modern_buttondown_am");
	elseif bThemeName == "Theme: FG Modern Dark" then
		setStateIcons(0, "modern_dark_buttonup_am");
		setStateIcons(1, "modern_dark_buttondown_am");
	elseif bThemeName == "Theme: FG Simple Brown" then
		setStateIcons(0, "brown_buttonup_am");
		setStateIcons(1, "brown_buttondown_am");
	elseif bThemeName == "Theme: FG Simple Gray" then
		setStateIcons(0, "gray_buttonup_am");
		setStateIcons(1, "gray_buttondown_am");
	elseif bThemeName == "Theme: FG Winter" then
		setStateIcons(0, "winter_buttonup_am");
		setStateIcons(1, "winter_buttondown_am");
	end
end