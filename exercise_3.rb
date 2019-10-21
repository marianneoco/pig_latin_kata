# Develop your work so far to treat 'qu' as a special case, so that those words
# end in 'quay'
# e.g. quick -> ickquay
#      quilt -> iltquay
#      qat   -> atqay

def pig_latin(word)
  if "aeiou".include?(word[0])
    return word + "way"
  elsif "qu" == word[0, 2]
    return word[2..-1] + "quay"
  else
    word.each_char.with_index(0) do |c, i|
      if "aeiou".include?(c)
        return word[i..-1] + word[0...i] + "ay"
      end
    end
  end
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(pig_latin('quick'), 'ickquay')
assert_equal(pig_latin('quilt'), 'iltquay')
assert_equal(pig_latin('qat'), 'atqay')
