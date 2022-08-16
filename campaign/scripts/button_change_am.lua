local _sKey = nil;

function onInit()
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
