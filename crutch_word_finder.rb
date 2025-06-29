# The words this script will ignore. Add your character names here following the instructions if you want to.
excluded_words = [
  # Most common words in the english language that I don't care for counting. Contractions should be listed without the apostrophe nor the letter after. Example: "hasn't" => "hasn" (this does mean you might get counts of "haven" that are actually uses of "haven't", but I left it out of the list in case you do use the actual word "haven")
  "about", "above", "after", "again", "against", "ago", "all", "am", "an", "and", "any", "are", "aren", "around", "as", "asked", "at", "away", "back", "be", "because", "been", "before", "behind", "between", "both", "but", "by", "can", "could", "couldn", "did", "didn", "do", "does", "doesn", "don", "down", "during", "each", "else", "em", "every", "everything", "few", "for", "from", "get", "go", "going", "got", "gotten", "had", "hadn", "has", "hasn", "have", "he", "her", "here", "hers", "herself", "him", "himself", "his", "how", "if", "in", "into", "is", "isn", "it", "its", "last", "less", "let", "like", "little", "ll", "long", "made", "make", "many", "me", "mine", "more", "much", "mr", "mrs", "must", "my", "need", "needn", "needed", "next", "no", "not", "nothing", "now", "of", "off", "often", "old", "on", "once", "or", "other", "our", "ours", "out", "over", "own", "part", "put", "re", "said", "same", "say", "she", "should", "since", "so", "some", "something", "soon", "such", "take", "tell", "than", "the", "their", "theirs", "them", "then", "there", "these", "they", "this", "through", "to", "told", "too", "took", "under", "until", "up", "upon", "us", "ve", "was", "wasn", "way", "we", "were", "weren", "what", "when", "where", "which", "while", "who", "why", "will", "with", "without", "won", "would", "wouldn", "yes", "you", "your", "yours",
  # Add words/names you want to exclude from the count following the format
  "example-word", "character-name",
]

# Paste here your text after having removed all single and double quotes. 
text = "Lorem ipsum dolor sit amet."

clean_text = text.gsub(/[^a-zA-ZÀ-ÖØ-öø-ÿ]/, ' ').delete(",").gsub(/\b[a-zA-Z]\b/, ' ') #removes all special characters, commas, and standalone letters, respectively.

# Breaks down the text into words and counts them one by one, spitting them out as a hash. 
words = clean_text.downcase.split.each_with_object(Hash.new(0)) do |word, count| #processes and splits the text into individual words, creates a list of words
  count[word] += 1 unless excluded_words.include? word #counts how many times a word was used, unless they are in "excluded_words"
end

# Sorts the list of words alphabetically and deletes all words with 3 uses or less.
crutch_words = words.sort_by {|k, v| -v}.delete_if{|key,value| value <= 3}

# Formats the list in a way that's easier to digest and prints it out. 
puts(crutch_words.map{|k,v| k.to_s + ": " + v.to_s})
