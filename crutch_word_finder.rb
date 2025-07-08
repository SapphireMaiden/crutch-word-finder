excluded_words = [
  # Most common words in the english language that I don't care for counting. Contractions should be listed without the apostrophe nor the letter after. Example: "hasn't" => "hasn" (this does mean you might get counts of "haven" that are actually uses of "haven't", but I left it out of the list in case you do use the actual word "haven")
  "about", "above", "after", "again", "against", "ago", "all", "am", "an", "and", "any", "are", "aren", "around", "as", "asked", "at", "away", "back", "be", "because", "been", "before", "behind", "between", "both", "but", "by", "can", "could", "couldn", "did", "didn", "do", "does", "doesn", "don", "down", "during", "each", "else", "em", "every", "everything", "few", "for", "from", "get", "go", "going", "got", "gotten", "had", "hadn", "has", "hasn", "have", "he", "her", "here", "hers", "herself", "him", "himself", "his", "how", "if", "in", "into", "is", "isn", "it", "its", "last", "less", "let", "like", "little", "ll", "long", "made", "make", "many", "me", "mine", "more", "much", "mr", "mrs", "must", "my", "need", "needn", "needed", "next", "no", "not", "nothing", "now", "of", "off", "often", "old", "on", "once", "or", "other", "our", "ours", "out", "over", "own", "part", "put", "re", "said", "same", "say", "she", "should", "since", "so", "some", "something", "soon", "such", "take", "tell", "than", "the", "their", "theirs", "them", "then", "there", "these", "they", "this", "through", "to", "told", "too", "took", "under", "until", "up", "upon", "us", "ve", "was", "wasn", "way", "we", "were", "weren", "what", "when", "where", "which", "while", "who", "why", "will", "with", "without", "won", "would", "wouldn", "yes", "you", "your", "yours", 
  # Add words/names you want to exclude from the count following the format
  "example-word", "character-name",
] 
# Read and prep file ---------------------------------------------------------------
# Insert route and name of your file between the quotes below. Remember to search and delete all quotes (single, double, plain and smart) from it first, and paste it as HTML.
text = File.read("words_to_find.md")

clean_text = text.to_s.gsub(/[^a-zA-ZÀ-ÖØ-öø-ÿ]/, ' ').delete(',').gsub(/\b[a-zA-Z]\b/, ' ').downcase.split # removes special characters, punctuaction, single letters, spaces, and downcases the word to prepare it for the next step

# Find crutch words ----------------------------------------------------------------
words = clean_text.each_with_object(Hash.new(0)) do |word, count| #processes and splits the text into individual words, creates a list of words
  count[word] += 1 unless excluded_words.include? word #counts how many times a word was used, unless they are in "excluded_words"
end

crutch_words = words.delete_if{|key,value| value <= 3} # deletes all words with three or less uses.

crutch_words_list = crutch_words.sort_by {|k, v| -v}.map{|k,v| k.to_s + ": " + v.to_s} #sorts the list of words alphabetically and formats the list of words and counts

# Highlight crutch words in text ---------------------------------------------------
processed_words = [] # where the script will store the new text as it processes each word

text.split.each do |word| #splits the text into words and checks each one individually
  clean_word = word.to_s.downcase 

  if crutch_words.include? clean_word
    highlighted_word = "==" + word + "==" #adds markdown highlighting to a crutch word
    processed_words.push(highlighted_word) #adds the highlighted word to the new text
  else
    processed_words.push(word) # adds the words that don't need to be highlighted to the new text, unchanged
  end 
end

# Format and create output file ----------------------------------------------------
processed_text = processed_words.join(" ") #turns all the split-up words back into a readable text with spaces

new_file = File.new("crutch_words_diagnosed.html", "a") # creates a new file
new_file.syswrite(crutch_words_list) # writes the list of crutch words into the new file
new_file.syswrite(processed_text) # writes the annotated text onto the file
new_file.close() # closes the file to finish up
