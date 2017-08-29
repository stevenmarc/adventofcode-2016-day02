## get the instructions from the file to an array of lines
instructions = Array.new
File.readlines("input.txt").each do |line|
  instructions.push(line)
end

## define the keypad as 2D array and define starting key
keypad = [[nil, nil, 1,   nil, nil],
  [nil, 2,   3,   4,   nil],
  [5,   6,   7,   8,   9],
  [nil, 'A', 'B', 'C', nil],
  [nil, nil, 'D', nil, nil]]
x = 2
y = 0
pin_code = ""

## go through each line of instructions to find the corresponding key
instructions.each do |instruction_line|
  instruction_line = instruction_line.chars
  instruction_line.each do |instruction|
    x -= 1 if instruction == "U" && x > 0 && !keypad[x-1][y].nil?
    x += 1 if instruction == "D" && x < 4 && !keypad[x+1][y].nil?
    y -= 1 if instruction == "L" && y > 0 && !keypad[x][y-1].nil?
    y += 1 if instruction == "R" && y < 4 && !keypad[x][y+1].nil?
  end
  pin_code << keypad[x][y].to_s
end
puts pin_code
