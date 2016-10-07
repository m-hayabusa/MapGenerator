debug.Load("generator.height")
height = function()
  debug.Exec("generator.height()")

  local mapping = function(j_x, j_y, i)
    if not (j_x < 1+1 or j_x > World.size-1 or j_y < 1+1 or j_y > World.size-1) then
      if i == 1
      and World.Map[j_x +1][j_y].Type == CellType.Sea
      or  World.Map[j_x -1][j_y].Type == CellType.Sea
      or  World.Map[j_x][j_y +1].Type == CellType.Sea
      or  World.Map[j_x][j_y -1].Type == CellType.Sea then
        return 1
      end

      for i = 1, 16 do
        if World.Map[j_x +1][j_y].Height == i-1 or nil
        and World.Map[j_x -1][j_y].Height == i-1 or nil
        and World.Map[j_x][j_y +1].Height == i-1 or nil
        and World.Map[j_x][j_y -1].Height == i-1 or nil then
          return i
        end
        if World.Map[j_x +1][j_y].Height == i-1 or nil
        or  World.Map[j_x -1][j_y].Height == i-1 or nil
        or  World.Map[j_x][j_y +1].Height == i-1 or nil
        or  World.Map[j_x][j_y -1].Height == i-1 or nil then
          return i
        end
      end
    else
      return 1
    end
  end

  for i = 1,5 do
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        if World.Map[i_x][i_y].Type ~= CellType.Sea then
          World.Map[i_x][i_y].Height = mapping(i_x, i_y, i)
          --  debug.ComplateOW("generator.height() "..i ..','..i_x..','..i_y..','..j_x..','..j_y)
        else
          World.Map[i_x][i_y].Height = 0
        end
      end
    end
  end

  for i_x = 1, World.size do
    for i_y = 1, World.size do
      if not World.Map[i_x][i_y].Height then
        World.Map[i_x][i_y].Height = '*'
      end
    end
  end

  debug.Complate("generator.height()")
end
