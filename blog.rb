require 'rubygems'
require 'cloud'

#this example shows how to generate a wordcloud from a blogs rss feed. The blog in this example is a popular Danish chick-blog.
#We use the font Times-Roman color palette "heat" and a distance function which makes an ellipse shaped cloud. 
#All words are placed horizontally.

temp = PaperSizes.new
@paper_sizes = temp.paper_sizes
@ordered_sizes = temp.ordered_sizes
options = {:rss => 'http://www.spacemermaid1001.dk/feed/',
  :min_font_size => 12,
  :max_words => 100,
  :font => "Times-Roman",
  :palette => "heat",
  :lang => "DA",
  :distance_type => "ellipse",
  :short_name => "spacemermaid_Times-Roman_ellipse"
}

t = time { 
  @cloud = WordCloud.new(options)
  @cloud.place_boxes("horizontal")
  @cloud.put_placed_boxes_in_pdf
  @cloud.dump_pdf
}
puts "execution took #{t} seconds"