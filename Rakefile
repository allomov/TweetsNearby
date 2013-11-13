# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
  puts "wtf!!!"
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'TweetsNearby'
  app.frameworks += ['CoreLocation', 'MapKit', 'AddressBook']

  app.pods do
    pod 'AFNetworking'
    pod 'KNSemiModalViewController'
  end

end
