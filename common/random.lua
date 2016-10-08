--
-- Created by IntelliJ IDEA.
-- User: shash
-- Date: 2016/10/08
-- Time: 8:56
-- To change this template use File | Settings | File Templates.
--
debug.Load("common/random")
module( "random", package.seeall )

randseed = 1
main = function(raito, a, b)
    math.randomseed(os.clock()*10^6 + os.time() + randseed)
    randseed = randseed + 1
    if math.random(0,10) < raito then
        return a
    else
        return b
    end
end
