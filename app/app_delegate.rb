class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'objc-pointer-crash'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    scrollView = UIScrollView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    scrollView.scrollEnabled = true
    scrollView.contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height * 2)

    sub = UIView.alloc.initWithFrame(CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height * 2))
    sub.backgroundColor = UIColor.grayColor

    label = UILabel.alloc.initWithFrame(CGRectMake(0, 150, UIScreen.mainScreen.bounds.size.width, 25))
    label.textAlignment = UITextAlignmentCenter
    label.text = "↕️ Scroll Up to Crash"

    sub.addSubview(label)

    scrollView.addSubview(sub)


    scrollView.delegate = self


    rootViewController.view.addSubview(scrollView)

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end

  def scrollViewWillEndDragging(scrollView, withVelocity:velocity, targetContentOffset:targetContentOffset)

    # targetContentOffset is a <Pointer>
    # just calling .value on it will crash
    # when it goes out of scope

    targetContentOffset.value

    puts "scroll ended"
  end
end
