class MapController < UIViewController
  extend IB

  ## ib outlets
  outlet :map, MKMapView
  outlet :activity, UIActivityIndicatorView
  outlet :slider, UISlider

  ## ib actions
  ib_action :slider_value_changed
  
  def slider_value_changed(sender)
    if view.annotation.respond_to? :url
      AFMotion::Image.get(view.annotation.url) do |result|
        self.presentSemiView(result.object.uiimageview)
      end
    end
  end

  private

  def show_nearby_tweets
    clean_annotations

    activity.startAnimating

    Tweet.search(user_coordinate, region_distance_meters) do |tweets|
      activity.stopAnimating
      tweets.each do |tweet|
        map.addAnnotation(tweet)
      end
    end
  end

  def clean_annotations
    tweet_annotations = map.annotations.reject {|a| a == map.userLocation}
    map.removeAnnotations(tweet_annotations)
  end

  def set_map_region
    map.setCenterCoordinate(user_coordinate, animated: true)
    region = MKCoordinateRegionMakeWithDistance(user_coordinate, region_distance_meters, region_distance_meters)
    map.setRegion(region)
  end

  def has_user_coordinate?
    map.userLocation.location
  end

  def user_coordinate
    map.userLocation.location.coordinate
  end

  def slider_value_changed(sender)
    set_map_region
    show_nearby_tweets
  end

  def region_distance_meters
    slider.value * 5000
  end

end
