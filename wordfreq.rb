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
    @@words = File.read(filename).downcase.gsub(/[^a-zA-Z]/, " ").split(/ /) - STOP_WORDS

    @@counts = Hash.new 0

    @@words.each do |word|
      if word != '' then @@counts[word] += 1
    end
  end
      @@ordered_results = @@counts.sort_by{|keys, values| values}.reverse

      puts @@ordered_results
  end

  def frequency(word)
    @@words.count(word)
  end

  def frequencies
    # https://jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/
    return @@counts
  end

  def top_words(number)
    @@ordered_results.first(number)
  end

  def print_report
    @@ordered_results.first(10).each{|result|
      word = result[0]
      count = result[1]
      puts "#{word} | #{count} " + ("*" * count.to_i)
    }


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
