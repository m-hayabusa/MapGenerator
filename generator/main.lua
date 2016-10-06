debug.Load("generator")
module( "generator", package.seeall )

require("generator/smoothing")
require("generator/height")

main = function ()
  debug.Exec("generator.main()")
  World.Map = {}
  -- ベースとなるマップを乱数で生成
  for i_x = 1, World.size do
    World.Map[i_x] = {}
    for i_y = 1, World.size do
      World.Map[i_x][i_y] = {
        Type = randomizer(World.SeaRaito, CellType.Sea, CellType.Land),
      }
    end
  end
  generator.smoothing()
  generator.height()
  debug.Complate("generator.main()")
end
