#!/usr/bin/lua

require "common/debugMsg"
debug.Load("main.lua")
require("CellType")
require("generator/main")


init = function ()
  World = {}
  World.size = 32                       -- 01 ~ メモリとディスプレイサイズが許す限り
  World.SeaRaito = 9.99                    -- 00 ~ 10
  World.raitoZeroHeightCellCount = 10  -- 00 ~ 10
  World.SmoothingTime = 15              -- 00 ~ CPUと時間が許す限り
  raitoHeightColor = 15
  viewmode = 3 -- 1:IDのみ 2:ANSIカラー 3:24ビットカラー 4:ANSIカラー+高さ 5:24ビットカラー+高さ
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
end
init()


viewer = function ()
  debug.Exec("main.lua.viewer()")
  local switch={}
  switch[1]=function()
    debug.Msg("ID")
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        io.write(string.format("%03d", World.Map[i_x][i_y].Type.ID)..' ')
      end
      print()
    end
  end
  switch[2]=function()
    debug.Msg("ANSI Color")
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        io.write("\x1b[48;5;"..World.Map[i_x][i_y].Type.Color.ANSI..'m '..' '.."\x1b[49m")
      end
      print()
    end
  end
  switch[3]=function()
    debug.Msg("24bit Color")
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        io.write("\x1b[48;2;"..World.Map[i_x][i_y].Type.Color.r + World.Map[i_x][i_y].Height * raitoHeightColor ..';'..World.Map[i_x][i_y].Type.Color.g + World.Map[i_x][i_y].Height * raitoHeightColor..';'..World.Map[i_x][i_y].Type.Color.b + World.Map[i_x][i_y].Height * raitoHeightColor..'m'..'  '.. "\x1b[49m")
      end
      print()
    end
  end
  switch[4]=function()
    debug.Msg("ANSI Color + Height")
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        io.write("\x1b[48;5;"..World.Map[i_x][i_y].Type.Color.ANSI..'m '..World.Map[i_x][i_y].Height or X.."\x1b[49m")
      end
      print()
    end
  end
  switch[5]=function()
    debug.Msg("24bit Color + Height")
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        io.write("\x1b[48;2;"..World.Map[i_x][i_y].Type.Color.r + World.Map[i_x][i_y].Height * raitoHeightColor ..';'..World.Map[i_x][i_y].Type.Color.g + World.Map[i_x][i_y].Height * raitoHeightColor..';'..World.Map[i_x][i_y].Type.Color.b + World.Map[i_x][i_y].Height * raitoHeightColor..'m'..' '..World.Map[i_x][i_y].Height .. "\x1b[49m")
      end
      print()
    end
  end
  switch[viewmode]()

  debug.Complate("main.lua.viewer()")
end

function main()
  generator.main()
  viewer()
end

main()
