#!/usr/bin/lua

require ("common/debugMsg")
debug.Load("main.lua")

init = function ()
  World = {}
  World.size = 32             -- 01 ~ メモリとディスプレイサイズが許す限り
  World.Mode = 1              -- 1:Default 2:Mountains 3:Islands

  debugmode = true

  if debugmode then debug.Msg("I'm in debugmode.") end


  require("common/random")
  require("CellType")
  require("WorldType")
  require("generator/main")
  require("viewer")
end

function main()
  init()
  generator.main()
  viewer.main()
end

main()
