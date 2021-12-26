def substrings(string, dictionary)
  string.downcase!
  characters = string.split("")
  alphabet = ("a".."z").to_a
  alphabet[27] = " "
  characters_to_obliterate = characters.select { |character| !alphabet.include?(character)}
  characters.map! do |character|
    if characters_to_obliterate.include?(character)
      character = " "
    else
      character
    end
  end
  filtered_string = characters.join
  words_matched = dictionary.map { |entry| filtered_string.scan(entry) }.select { |group| group.length > 0 }
  result = {}
  words_matched.each do |group|
    result[group[0]] = group.length
  end
  result
end

dictionary = dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)