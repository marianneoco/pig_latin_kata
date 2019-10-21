# Develop your proram to handle multiple consonants at the start of words.
#
# The rule is:
# If the word starts with one or more consonants, move them to the end.
# e.g. cram     -> amcray
#      sprinkle -> inklespray
#
# Still assume the words are lowercase.

def pig_latin(word)
  if "aeiou".include?(word[0])
    return word + "way"
  else
    word.each_char.with_index do |c, i|
      if "aeiou".include?(c)
        return word[i..-1] + word[0...i] + "ay"
      end
    end
  end
end
     # word[1..-1] + word[0] + "ay"

=begin
first_vowel_index = 0
word.each_char do |c|
  if "aeiou".include?(c)
    return word[first_vowel_index..-1] + word[0...first_vowel_index] + "ay"
=end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(pig_latin('cram'), 'amcray')
assert_equal(pig_latin('sprinkle'), 'inklespray')
assert_equal(pig_latin('dog'), 'ogday')
assert_equal(pig_latin('up'), 'upway')
