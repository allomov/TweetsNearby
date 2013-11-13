[RubyMotion](http://rubymotion.com/) iOS app to find twitters near you.


Install
===
```
bundle install 
pod setup
rake pod:install
```

Commands:
```
→ ib controller Map UIViewController --outlets map:MKMapView activity:UIActivityIndicatorView slider:UISlider --action slider_value_changed
```

```
→ rake ib:open
```
* create Storyboard in Resource folder 
* create UIViewController with MKMapView, UIActivityIndicatorView, UISlider
* set UIViewController MapController class
* open "Support Files/Stubs.h" file 
* connect outlets and actions from Storyboard with 
