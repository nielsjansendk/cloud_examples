require 'rubygems'
require 'cloud'

#this example shows how to generate a wordcloud from a delicious name. This uses my delicious account (ninajansen).
#The example uses the font Times-Roman, color palette "clay" and a standard radial function which makes a circle shaped cloud.  
#All words are placed mostly horizontally, which means that 10% of the words are vertical. 
#This is a 200 word cloud, so it will take a while.

temp = PaperSizes.new
@paper_sizes = temp.paper_sizes
@ordered_sizes = temp.ordered_sizes
options = {:delicious => 'ninajansen',
  :min_font_size => 12,
  :max_words => 200,
  :font => "Times-Roman",
  :palette => "clay",
  :lang => "DA",
  :short_name => "delicious_200_Times-Roman_mostly_horizontal"
}

t = time { 
  @cloud = WordCloud.new(options)
  @cloud.place_boxes("mostly_horizontal")
  @cloud.put_placed_boxes_in_pdf
  @cloud.dump_pdf
}
puts "execution took #{t} seconds"
