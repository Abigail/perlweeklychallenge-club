#!/opt/homebrew/opt/ruby/bin/ruby

ARGF . each_line do |line|
    max = 0
    line . scan /([1-9])\1*/ do             # Iterate over all matches
        max = $& . to_i if $& . to_i > max  # Remember the largest match
    end
    puts max
end
