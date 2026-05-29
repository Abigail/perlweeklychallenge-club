#!/opt/homebrew/bin/lua
 
 
for line in io . lines () do
    local max = 0
    for i = 1, 9 do
        --
        -- For all digits 1 to 9, find sequences of this digit
        --
        for seq in line : gmatch (tostring (i) .. "+") do
            --
            -- If such a sequence exceeds max, remember this
            --
            if   max < tonumber (seq)
            then max = tonumber (seq)
            end
        end
    end
    print (max)
end
