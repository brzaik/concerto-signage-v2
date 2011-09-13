require 'rss'

class FrontpageController < ApplicationController
  def index
    @pages = Page.all
    
    begin
      open('http://concerto-signage.org/blog/?feed=rss2')
    rescue
      @found_blog = false
    else 
      @found_blog = true
      @rss = RSS::Parser.parse(open('http://concerto-signage.org/blog/?feed=rss2').read, false)
    end
  end
end

