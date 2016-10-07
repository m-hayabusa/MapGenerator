#!/usr/bin/lua

require "common/debugMsg"
debug.Load("main.lua")

init = function ()
  World = {}
  World.size = 32                       -- 01 ~ メモリとディスプレイサイズが許す限り
  World.Mode = 1              -- 1:Default 2:Mountains 3:Islands

  debugmode = true

  if debugmode then debug.Msg("I'm in debugmode.") end
  randseed = 1
  randomizer = function(raito, a, b)
    math.randomseed(os.clock()*10^6 + os.time() + randseed)
    randseed = randseed + 1
    if math.random(0,10) < raito then
      return a
    else
      return b
    end
  end

  require("CellType")
  require("WorldType")
  require("generator/main")
  require("viewer")
end
init()

function main()
  generator.main()
  viewer.main()
end

main()
