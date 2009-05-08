require 'rubygems'
require 'cloud'

#this example shows how to generate a wordcloud from a text file. 
#The example uses the font Times-Roman, color palette "winter" and a distance function which makes an ellipse shaped cloud.  
#All words are placed horizontally.

temp = PaperSizes.new
@paper_sizes = temp.paper_sizes
@ordered_sizes = temp.ordered_sizes
options = {:file => File.dirname(__FILE__) + '/gettysburg.txt',
           :min_font_size => 12,
           :max_words => 100,
           :font => "Times-Roman",
           :palette => "winter",
           :lang => "EN",
           :distance_type => "radial_ll",
           :short_name => "gettysburg_100_Times-Roman_horizontal_radial_ll"          
}
t = time { 
  @cloud = WordCloud.new(options)
  @cloud.place_boxes("horizontal")
  @cloud.put_placed_boxes_in_pdf
  @cloud.dump_pdf
}
puts "execution took #{t} seconds"