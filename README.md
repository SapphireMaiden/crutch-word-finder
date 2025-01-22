# Crutch word finder

Use this script to check your manuscript for crutch words: those sneaky words you use too often without noticing and they go on to annoy your readers. 
This script can be run online or locally (the latter is way faster), provided you install ruby first. 

## Instructions:
  * Put your draft in a word processor (Word, GDocs, even Windows Notepad), and do a search and replace. Replace all quotes (") with a space. Don't skip this step! Ruby uses quotes to determine the beginning and end of the text, so having any quotes inside your text will make the script crash quite spectacularly.
    * Make sure you're replacing all three types of quotes: normal quotes ("), opening smart quotes (“), and closing smart quotes (”).
  * Download the file `crutch_word_finder.rb` to your computer and open it with an app like notepad, notepad++, sublime text, etc.
  * Paste the quote-less text inside the quotes to the right of `text` in line 3, replacing the Lorem Ipsum placeholder text.
  * Add any words you want excluded from the results to `excluded_words` in line 1 following exactly the format of the words already there: each word wrapped in quotes, separated with a comma (outside of the quotes). No comma after the last word.
    * These could be names of characters or places, or you could even build your own set for a different language. I'm excluding the most common words in the english language so that they don't pollute the results.
  * By default, this script will show you all the words you've used more than 3 times. If you want to change that (let's say, to only see words you've used more than 5 times), simply change the number in line 11. If you replace the 3 for a 5, the script will only show you words you've used more than 5 times.
  * Save the file. This will be the ready-to-use script. 

## To run online (no install required):
  * Paste the ready-to-use script https://runrb.io and click the play button. 
  * You're done! Collect your results from the black box at the bottom.

## To run locally (you'll need to install ruby, but it'll be a thousand times faster):
  * For windows: https://rubyinstaller.org/
  * Check that ruby is installed correctly. Open a terminal and type `ruby -v`. On enter, it should display the version of ruby you installed. Something along the lines of `ruby 3.2.4 (2024-04-23 revision af471c0e01) [x64-mingw-ucrt]`
  * Open a terminal / command prompt. 
  * Navigate to the folder in which you've got the modified `crutch_word_finder.rb` file using cd. For example `cd downloads` , `cd documents` , etc.
    * To go back if you made a mistake, type `cd ..` .
  * Type in `ruby crutch_word_finder.rb` and enter. You're done! Collect your results from the terminal.

## Troubleshooting:
If the script crashes or raises an error, first check that your formatting is right. Check that:
  * `excluded_words` doesn't have any missing quotes, extra or missing commas, and that the opening and closing square brackets are still in place.
  * `text` is wrapped in quotes, and there aren't any other quotes aside from those.
