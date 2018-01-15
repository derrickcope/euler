#!/usr/bin/env ruby
#
# euler11.rb
#

#20x20 grid input. there must be a better way.
row01 = %w[08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08]
row01.map!(&:to_i)

row02 = %w[49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00]
row02.map!(&:to_i)

row03 = %w[81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65]
row03.map!(&:to_i)

row04 = %w[52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91]
row04.map!(&:to_i)

row05 = %w[22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80]
row05.map!(&:to_i)

row06 = %w[24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50]
row06.map!(&:to_i)

row07 = %w[32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70]
row07.map!(&:to_i)

row08 = %w[67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21]
row08.map!(&:to_i)

row09 = %w[24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72]
row09.map!(&:to_i)

row10 = %w[21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95]
row10.map!(&:to_i)

row11 = %w[78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92]
row11.map!(&:to_i)

row12 = %w[16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57]
row12.map!(&:to_i)

row13 = %w[86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58]
row13.map!(&:to_i)

row14 = %w[19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40]
row14.map!(&:to_i)

row15 = %w[04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66]
row15.map!(&:to_i)

row16 = %w[88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69]
row16.map!(&:to_i)

row17 = %w[04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36]
row17.map!(&:to_i)

row18 = %w[20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16]
row18.map!(&:to_i)

row19 = %w[20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54]
row19.map!(&:to_i)

row20 = %w[01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48]
row20.map!(&:to_i)


#array of array for grid
grid = Array.new
grid.push(row01,row02,row03,row04,row05,row06,row07,row08,row09,row10,row11,row12,row13,row14,row15,row16,row17,row18,row19,row20)

#some horizontal products
row = 0
proarr = Array.new
while row <= 19
  column = 0
  while column <= 16
    forarr = grid[row][column,4]
    proarr.push(forarr.inject(:*))
    column += 1
  end
  row += 1
end
puts proarr.max

#vertical products
column = 0
while column <= 19
  row = 0
  while row <= 16
    forarr = []
#    #p row
#    #p column
    forarr.push(grid[row][column])
    forarr.push(grid[row+1][column])
    forarr.push(grid[row+2][column])
    forarr.push(grid[row+3][column])
#    p forarr
    proarr.push(forarr.inject(:*))
    row += 1
  end
  column += 1
end
#p proarr
puts proarr.max

#diagonal right
row = 0
while row <= 16
  column = 0
  while column <= 16
    forarr = []
#    p row
#    p column
    forarr.push(grid[row][column])
    forarr.push(grid[row+1][column+1])
    forarr.push(grid[row+2][column+2])
    forarr.push(grid[row+3][column+3])
#    p forarr
    proarr.push(forarr.inject(:*))
    column += 1
  end
  row += 1
end
#p proarr
puts proarr.max

row = 0 
while row <= 16
  column = 19 
  while column >= 3 
    forarr = []
#    p row
#    p column
    forarr.push(grid[row][column])
    forarr.push(grid[row+1][column-1])
    forarr.push(grid[row+2][column-2])
    forarr.push(grid[row+3][column-3])
#    p forarr
    proarr.push(forarr.inject(:*))
    column -= 1
  end
  row += 1
end


puts proarr.max
