require 'csv'

# To calculate the frequency of words, you must:
#
# remove punctuation
# normalize all words to lowercase
# remove "stop words" -- words used so frequently they are ignored
# go through the file word by word and keep a count of how often each word is used
# When your program is complete, you should be able to run ruby wordfreq.rb seneca_falls.txt and get a printed report like this:

#     her | 33 *********************************
#     all | 12 ************
#   which | 12 ************
#    they | 7  *******
#   their | 7  *******
#     she | 7  *******
#    this | 6  ******
#    them | 6  ******
#   women | 6  ******
#  rights | 6  ******

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    words = CSV.read(filename).join("','").downcase.gsub(/[^a-z0-9\s]/i, '').split(/ /) - STOP_WORDS

    puts words

  end

  def frequency(word)
  end

  def frequencies
  end

  def top_words(number)
  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
