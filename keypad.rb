## get the instructions from the file to an array of lines
instructions = Array.new
File.readlines("input.txt").each do |line|
  instructions.push(line)
end

## define the keypad as 2D array and define starting key
keypad = [[1,2,3],
  [4,5,6],
  [7,8,9]]
x = 1
y = 1
pin_code = ""

## go through each line of instructions to find the corresponding key
instructions.each do |instruction_line|
  instruction_line = instruction_line.chars
  instruction_line.each do |instruction|
    x -= 1 if instruction == "U" && x > 0
    x += 1 if instruction == "D" && x < 2
    y -= 1 if instruction == "L" && y > 0
    y += 1 if instruction == "R" && y < 2
  end
  pin_code << keypad[x][y].to_s
end
puts pin_code
