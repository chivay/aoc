-- 12 red 13 green 14 blue
function is_legal(result)
    return  result.red <= 12 and result.green <= 13 and result.blue <= 14
end

function parse_result(s)
    s = { red = 0, green = 0, blue = 0}
    for num, color in string.gmatch(entry, "(%d+) ([a-z]+)") do
        s[color] = tonumber(num)
    end
    return s
end

total = 0
total_power = 0

for line in io.lines("input") do
    game_id, results = string.match(line, "Game (%d+): (.*)")

    minset = nil
    game_ok = true

    while true do
        entry = string.match(results,"([^;]+)")
        if entry == nil then break end

        s = parse_result(entry)
        if minset == nil then
            minset = s
        end

        minset.red = math.max(minset.red, s.red)
        minset.green = math.max(minset.green, s.green)
        minset.blue = math.max(minset.blue, s.blue)

        game_ok = game_ok and is_legal(s)
        results = string.sub(results, #entry + 2, #results)
    end

    if game_ok then
        total = total +  tonumber(game_id)
    end

    power = minset.red * minset.green * minset.blue
    total_power = total_power + power
end

print(total)
print(total_power)
