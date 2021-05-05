 class BackgroundsController < ActionController::Base

  def random
    path = File.join('img', 'background', params['for'])
    
    directory = Rails.root.join('public', path)
    unless File.directory?(directory)
      raise ActionController::RoutingError.new("Background directory '#{params['for']}' not found")
    end
    
    images = Dir.entries(directory).select{|name|name=~/.*\.jpg/}
    if images.none?
      raise ActionController::RoutingError.new("No backgrounds found in '#{params['for']}'")
    end
    
    redirect_to "/#{[path, images.sample].join('/')}"
  end

 end
