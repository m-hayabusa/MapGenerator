smoothing = function()
  debug.Exec("generator.smoothing()")
  -- 周辺のセルのIDを確認､そのIDのセルの個数に対応する確率でそのIDに変化するように
  for i = 1, World.SmoothingTime do
    for i_x = 1, World.size do
      for i_y = 1, World.size do
        local ZeroHeightCellCount = 0

        if World.SmoothingMode == 1 or World.SmoothingMode == 3 then
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
        end

        if World.SmoothingMode == 2 or World.SmoothingMode == 4 then
            --上下左右ではなく3x3の正方形
            for j_x = i_x-1,i_x+1 do
              for j_y = i_y-1, i_y+1 do
                if j_x < 1 or j_x > World.size or j_y < 1 or j_y > World.size or World.Map[j_x][j_y].Type.Height == CellType.Sea.Height then
                  ZeroHeightCellCount = ZeroHeightCellCount + 0.75
                end
              end
            end
        end

        if World.SmoothingMode == 3 or World.SmoothingMode == 4 then
            --そのセルを挟んで左右が同じTypeの場合､左右に近づける
            if not (i_x - 1 < 1 or i_x + 1 > World.size) then
              if World.Map[i_x+1][i_y].Type == World.Map[i_x-1][i_y].Type and World.Map[i_x][i_y].Type ~= World.Map[i_x-1][i_y].Type then
                ZeroHeightCellCount = ZeroHeightCellCount + 0.1
              end
            end
            if not (i_y - 1 < 1 or i_y + 1 > World.size) then
              if World.Map[i_x][i_y+1].Type == World.Map[i_x][i_y-1].Type and World.Map[i_x][i_y].Type ~= World.Map[i_x][i_y-1].Type then
                ZeroHeightCellCount = ZeroHeightCellCount + 0.1
              end
            end
        end

        World.Map[i_x][i_y].Type = random.main(ZeroHeightCellCount /4 *World.raitoZeroHeightCellCount, CellType.Sea, CellType.Land)
      end
    end
    debug.ComplateOW("generator.smoothing() "..i ..'/'..World.SmoothingTime)
    if i == World.SmoothingTime then io.write('\n') end
  end
end
