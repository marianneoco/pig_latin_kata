# Write the program to reverse the above
# e.g. "Ethay uickqay oxfay umpedjay overway ethay azylay ogday" ->
#      "The quick fox jumped over the lazy dog"

VOWELS = "aeiou"

def pig_latin_sentence_reverse(sentence)
 regular_sentence = []
 sentence.split(" ").each do |word|
   regular_sentence << convert(word)
 end
 return regular_sentence.join(" ")
end

def preserve_capitals(original_word, final_word)
  if original_word[0] == original_word[0].upcase
    return final_word.capitalize
  else
    return final_word
  end
end

def convert(word)
  if VOWELS.include?(word[0]) && word.end_with?("way")
    return preserve_capitals(word, word[0..-4])
  elsif word.end_with?("quay")
    return preserve_capitals(word, "qu" + word[0..-5])
  else
    word_less_ay = word[0...-2]
    if word_less_ay == "eth"
      return preserve_capitals(word, "the")
    elsif word_less_ay == "Eth"
      return preserve_capitals(word, "the")
    else
      return preserve_capitals(word, word_less_ay[-1] + word_less_ay[0...-1])
    end
  end
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(
  pig_latin_sentence_reverse('Ethay ickquay oxfay umpedjay overway ethay azylay ogday'),
  'The quick fox jumped over the lazy dog'
)
