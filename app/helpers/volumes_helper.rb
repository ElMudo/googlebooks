module VolumesHelper
  
  # Paginator
  # Create links for pagination. Styling courtesy of Bootstrap.
  #   index:  the current position
  #   count:  the total number of pages
  #   offset: the number of page links to display either side of the current position
  #
  def paginator(index,count,offset=3)
    html = "<div class='pagination'>\n<ul>\n"
  	enabled = (index > 1) ? '' : ' class="disabled"'
  	url = link_to("prev", :controller => 'volumes', :page => index-1)
  	html += "<li#{enabled}>#{url}</li>\n"
    min_index = [index - offset, 1].max
    max_index = [index + offset, count].min
    index_range = Range.new(min_index, max_index)
    index_range.each do |n|
    	active = (n == index) ? ' class="active"' : ''
    	url = link_to("#{n}", :controller => 'volumes', :page => n)
    	html += "<li#{active}>#{url}</li>\n"
  	end
  	enabled = (index < count) ? '' : ' class="disabled"'
  	url = link_to('next', :controller => 'volumes', :page => index+1)
  	html += "<li#{enabled}>#{url}</li>\n"
    html += "</ul></div>\n"
    return raw html
  end
  
end
