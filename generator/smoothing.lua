smoothing = function()
  debug.Exec("generator.smoothing()")
  -- 周辺のセルのIDを確認､そのIDのセルの個数に対応する確率でそのIDに変化するように

  if World.SmoothingMode <= 4 then
      generator.terrain()
  end

  local switch = {}
  switch[1] = function(i_x, i_y)
      local ZeroHeightCellCount = 0
      if i_x - 1 < 1 or World.Map[i_x - 1][i_y].Type.Height == CellType.Sea.Height then
          ZeroHeightCellCount = ZeroHeightCellCount + 1
      end
      if i_x + 1 > World.size or World.Map[i_x + 1][i_y].Type.Height == CellType.Sea.Height then
          ZeroHeightCellCount = ZeroHeightCellCount + 1
      end
      if i_y - 1 < 1 or World.Map[i_x][i_y - 1].Type.Height == CellType.Sea.Height then
          ZeroHeightCellCount = ZeroHeightCellCount + 1
      end
      if i_y + 1 > World.size or World.Map[i_x][i_y + 1].Type.Height == CellType.Sea.Height then
          ZeroHeightCellCount = ZeroHeightCellCount + 1
      end
      World.Map[i_x][i_y].Type = random.main(ZeroHeightCellCount / 4 * World.raitoZeroHeightCellCount, CellType.Sea, CellType.Land)
  end

  switch[2] = function(i_x, i_y)
      local ZeroHeightCellCount = 0
      --上下左右ではなく3x3の正方形
      for j_x = i_x-1,i_x+1 do
          for j_y = i_y-1, i_y+1 do
              if j_x < 1 or j_x > World.size or j_y < 1 or j_y > World.size or World.Map[j_x][j_y].Type.Height == CellType.Sea.Height then
                  ZeroHeightCellCount = ZeroHeightCellCount + 0.75
              end
          end
      end
      World.Map[i_x][i_y].Type = random.main(ZeroHeightCellCount / 4 * World.raitoZeroHeightCellCount, CellType.Sea, CellType.Land)
  end

  switch[3] = function(i_x, i_y)
    local countSea = 0
    for j_x = i_x-1, i_x+1 do
        for j_y = i_y-1, i_y+1 do -- 範囲外マップまで参照するため
        if not World.Map[j_x] then
            World.Map[j_x] = {}  -- ここで範囲外のマップを
        end
        if not World.Map[j_x][j_y] then
            World.Map[j_x][j_y] = {}
            World.Map[j_x][j_y].Type = CellType.Sea -- 海に設定する
        end

        if World.Map[j_x][j_y].Type == CellType.Sea then
            countSea = countSea + 1 -- i_X,i_yの近くの海の個数を数えて
        end
        end
    end
    World.Map[i_x][i_y].Type = random.main(countSea * World.SeaRaito /10, CellType.Sea, CellType.Land)
    -- 確率で海を設定する
  end

  for i = 1, World.SmoothingTime do
      for i_x = 1, World.size do
          for i_y = 1, World.size do
              switch[World.SmoothingMode](i_x, i_y)
              debug.ComplateOW("generator.smoothing() "..i.."/"..World.SmoothingTime.." "..i_x..', '..i_y)
          end
      end

      debug.ComplateOW("generator.smoothing() "..i ..'/'..World.SmoothingTime)
      if i == World.SmoothingTime then io.write('\n') end
  end
end
