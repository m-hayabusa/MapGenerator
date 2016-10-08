--
-- Created by IntelliJ IDEA.
-- User: shash
-- Date: 2016/10/08
-- Time: 10:08
-- To change this template use File | Settings | File Templates.
--

debug.Load("generator.terrain")
terrain = function()
    debug.Exec("generator.terrain()")
    for i_x = 1, World.size do
        World.Map[i_x] = {}
        for i_y = 1, World.size do
            World.Map[i_x][i_y] = {
                Type = random.main(World.SeaRaito, CellType.Sea, CellType.Land)
            }
        end
    end
end