-- 
-- Please see the license.txt file included with this distribution for 
-- attribution and copyright information.
--

function getExtensionName()
	local tName = Extension.getExtensions();
	local sName = table.concat(tName, ",");
	return sName;
end
