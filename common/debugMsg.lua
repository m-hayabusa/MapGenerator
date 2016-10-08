--
-- Created by IntelliJ IDEA.
-- User: shash
-- Date: 2016/10/06
-- Time: 12:29
-- To change this template use File | Settings | File Templates.
--

module( "debug", package.seeall )

Msg = function(str)
    if debugmode then
        print("\x1b[47m\x1b[30m".."Info:".."\x1b[49m\x1b[39m "..str)
    end
end

Load = function(str)
    if debugmode then
        print("\x1b[47m\x1b[30m".."Load:".."\x1b[49m\x1b[39m "..str)
    end
end

Exec = function(str)
    if debugmode then
        print("\x1b[47m\x1b[30m".."Exec:".."\x1b[49m\x1b[39m "..str)
    end
end

Complate  = function(str)
    if debugmode then
        print("\x1b[47m\x1b[30m".."Comp:".."\x1b[49m\x1b[39m "..str)
    end
end

ComplateOW = function(str)
    if debugmode then
        io.write("\r\x1b[47m\x1b[30m".."Comp:".."\x1b[49m\x1b[39m "..str)
    end
end

Test = function(str)
    if debugmode then
        print("\x1b[49m\x1b[39m".."Test:".."\x1b[47m\x1b[30m"..str.."\x1b[49m\x1b[39m")
    end
end