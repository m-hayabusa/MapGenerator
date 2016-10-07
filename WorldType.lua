debug.Load("WorldType")
module( "WorldType", package.seeall )

local switch = {}
switch[1] = function() require ("WorldType/Default") end
switch[2] = function() require ("WorldType/Mountains") end
--switch[3] = function() require ("WorldType/Islands") end

switch[World.Mode]()