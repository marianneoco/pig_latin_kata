# Develop your work so far to preserve the existing capitalisation of the word
# e.g. Dog  -> Ogday
#      cram -> amcray
#
# Assume words either start with a capital letter or don't — don't worry about
# other formats

def preserve_capitals(original_word, final_word)
  if original_word[0] == original_word[0].upcase
    return final_word.capitalize
  else
    return final_word
  end
   # will return word with same capitalisation as orignal
end

def pig_latin(word)
    if "aeiou".include?(word[0])
      return preserve_capitals(word, word[2..-1] + "quay")
    elsif "qu" == word[0, 2]
      return preserve_capitals(word, word[2..-1] + "quay")
    else
      word.each_char.with_index(0) do |c, i|
        if "aeiou".include?(c)
          return preserve_capitals(word, word[i..-1] + word[0...i] + "ay")
      end
    end
  end
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(pig_latin('Dog'), 'Ogday')
assert_equal(pig_latin('cram'), 'amcray')
