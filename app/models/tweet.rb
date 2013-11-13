class Tweet
  attr_reader :title,  :url, :width, :height, :location
  
  def initialize(attrs)
    @location = Coordinate.new(attrs[:location])
  end
  
  def coordinate
    @location.to_cl
  end

  def self.search(coordinates, distance, &block)
    params = {}
    AFMotion::Client.shared.get('media/search', params) do |result|
      if result.success?
        tweets = json['data'].map{ |item| Tweet.new(item) }
        block.call(tweets)
      else
       #something went wrong
       raise "#{result.error.localizedDescription} #{result.body}"
      end
    end
  end
end
