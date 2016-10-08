debug.Load("generator")
module( "generator", package.seeall )

require("generator/terrain")
require("generator/smoothing")
require("generator/height")

main = function ()
  debug.Exec("generator.main()")
  World.Map = {}
  generator.smoothing()
  generator.height()
  debug.Complate("generator.main()")
end
