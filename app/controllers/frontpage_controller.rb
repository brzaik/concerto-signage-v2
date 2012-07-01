require 'rss'

class FrontpageController < ApplicationController

  caches_action :index, :unless => Proc.new{ user_signed_in? }

  def index
    @pages = Page.all
    
    blog_url = 'http://www.concerto-signage.org/blog/?feed=rss2'
    begin
      open(blog_url)
    rescue
      @found_blog = false
    else 
      @found_blog = true
      @rss = RSS::Parser.parse(open(blog_url).read, false)
    end
  end
end

