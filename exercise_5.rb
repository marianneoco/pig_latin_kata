# Develop your work so far to handle sentences
# e.g. "The quick fox jumped over the lazy dog" ->
#      "Ethay ickquay oxfay umpedjay overway ethay azylay ogday"

def pig_latin_sentence(sentence)
  pig_latin_array = []
  sentence.split(" ").each do |word|
    pig_latin_array.append(pig_latin(word))
  end
  return pig_latin_array.join(" ")
end

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
      return preserve_capitals(word, word + "way")
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
assert_equal(
  pig_latin_sentence('The quick fox jumped over the lazy dog'),
  'Ethay ickquay oxfay umpedjay overway ethay azylay ogday'
)
