class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    storyboard = UIStoryboard.storyboardWithName "Storyboard-iPhone", bundle: nil
    @window.rootViewController = storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible

    true
  end

  def setup_twitter_client
    AFMotion::Client.build_shared("https://api.twitter.com/1.1/") do
      operation :json
      header "Accept", "application/json"
    end
  end

end
