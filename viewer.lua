--
-- Created by IntelliJ IDEA.
-- User: shash
-- Date: 2016/10/07
-- Time: 9:24
-- To change this template use File | Settings | File Templates.
--

debug.Load("viewer")
module( "viewer", package.seeall )

main = function ()
    local raitoHeightColor = 10
    local viewmode = 3 -- 1:IDのみ 2:ANSIカラー 3:24ビットカラー 4:ANSIカラー+高さ 5:24ビットカラー+高さ

    debug.Exec("viewer.main()")
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

    debug.Complate("viewer.main()")
end
