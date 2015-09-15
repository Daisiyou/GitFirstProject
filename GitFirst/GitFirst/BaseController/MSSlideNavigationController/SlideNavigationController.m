//
//  Created by marco on 25/05/13.
//
//
//


#import "SlideNavigationController.h"
#import "PanGestureRecognizer.h"
#import "UIView+ScreenShot.h"

@interface SlideNavigationController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) PanGestureRecognizer *panGesture;
@property(weak, nonatomic) UIViewController *currentViewController;
@property(weak, nonatomic) UIViewController *previousViewController;
@property(strong, nonatomic) UIImageView *currentViewControllerImageView;
@property(strong, nonatomic) UIImageView *previousViewControllerImageView;
@property(assign, nonatomic) CGRect originalFrame;
@property (assign, nonatomic) BOOL shouldDetect;

@property (strong, nonatomic) NSArray *currentLeftButtonItems;
@property (strong, nonatomic) NSArray *currentRightButtonItems;
@property (strong, nonatomic) NSMutableArray *previousLeftButtonItemViews;
@property (strong, nonatomic) NSMutableArray *previousRightButtonItemViews;
@property (strong, nonatomic) dispatch_queue_t screenShotQueue;
@property (strong, nonatomic) NSMutableArray *screenShotStack;

@property (nonatomic) BOOL currentScrollViewWasEnabled;

@end

@implementation SlideNavigationController

//- (void)dealloc
//{
//  dispatch_release(_screenShotQueue);
//}

- (void)viewDidLoad
{
    
  [super viewDidLoad];
  _screenShotStack = [[NSMutableArray alloc] initWithCapacity:2];
  _screenShotQueue = dispatch_queue_create("screen_shot", DISPATCH_QUEUE_SERIAL);
  PanGestureRecognizer *panGestureRecognizer = [[PanGestureRecognizer alloc] initWithTarget:self action:@selector(panFired:)];
  panGestureRecognizer.delegate = self;
  panGestureRecognizer.maximumNumberOfTouches = 1;
  self.panGesture = panGestureRecognizer;
  [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)panFired:(PanGestureRecognizer *)panGestureRecognizer
{
  if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
    _shouldDetect = YES;
  }

  if (panGestureRecognizer.way != MSPanWayHorizontal && panGestureRecognizer.state != UIGestureRecognizerStateEnded) {
    return;
  }

  if (!_shouldDetect) {
    return;
  }

  if (panGestureRecognizer.state == UIGestureRecognizerStateBegan &&
    panGestureRecognizer.direction == MSPanDirectionRight) {
    _shouldDetect = NO;
    return;
  }

  if (self.viewControllers.count <= 1) {
    return;
  }

  UIView *currentView = [[self.viewControllers lastObject] view];
  UIView *view = [[[self.viewControllers lastObject] view] hitTest:[panGestureRecognizer locationInView:currentView] withEvent:nil];
  NSMutableArray *scrollViews = [[NSMutableArray alloc] initWithCapacity:2];
  while (view) {
    view = view.superview;
    if ([view isKindOfClass:[UIScrollView class]]) {
      [scrollViews addObject:view];
    }
  }
  if (scrollViews.count > 0) {
    UIScrollView *scrollView = [scrollViews lastObject];
    if (scrollView.contentOffset.x > 0) {
      return;
    }
  }
  
  if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
    [self prepareForSlide];
  }

  [self moveViewAndChangeNavButtonsWithGestureRecognizer:panGestureRecognizer];

  if (panGestureRecognizer.state == UIGestureRecognizerStateEnded ||
      panGestureRecognizer.state == UIGestureRecognizerStateCancelled ||
      panGestureRecognizer.state == UIGestureRecognizerStateFailed) {
    [self handleSlideEndedWithRecognizer:panGestureRecognizer];
  }
}

- (void)prepareForSlide
{
  NSUInteger nControllers = self.viewControllers.count;
  _currentViewController = self.visibleViewController;
  _previousViewController = self.viewControllers[nControllers - 2];
  _originalFrame = _currentViewController.view.frame;

  UIImage *currentViewControllerScreenShot = [_currentViewController.view screenShot];
  UIImage *previousViewControllerScreenShot = [self.screenShotStack lastObject];
  _currentViewControllerImageView = [[UIImageView alloc] initWithImage:currentViewControllerScreenShot];
  _previousViewControllerImageView = [[UIImageView alloc] initWithImage:previousViewControllerScreenShot];

  CGFloat verticalOffset = 0;
  if ([_currentViewController.view isKindOfClass:[UIScrollView class]]) {
    UIScrollView *scrollView = (UIScrollView *)_currentViewController.view;
    _currentScrollViewWasEnabled = [scrollView isScrollEnabled];
    scrollView.scrollEnabled = NO;
    verticalOffset = scrollView.contentOffset.y;
  }

  
  CGRect leftRect = _currentViewController.view.frame;
  if (!self.navigationBar.translucent && kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1) {
    leftRect.origin.y -= 64;
  }
  leftRect.origin.y += verticalOffset;
  leftRect.origin.x = leftRect.origin.x - leftRect.size.width;
  _previousViewControllerImageView.frame = leftRect;
  _previousViewControllerImageView.backgroundColor = [UIColor cyanColor];
  [_currentViewController.view addSubview:_currentViewControllerImageView];
  [_currentViewController.view addSubview:_previousViewControllerImageView];
  _currentViewController.view.clipsToBounds = NO;

  _currentLeftButtonItems = _currentViewController.navigationItem.leftBarButtonItems;
  _currentRightButtonItems = _currentViewController.navigationItem.rightBarButtonItems;

  NSArray *previousLeftItems = _previousViewController.navigationItem.leftBarButtonItems;;
  _previousLeftButtonItemViews = [NSMutableArray array];
  [previousLeftItems enumerateObjectsUsingBlock:^(UIBarButtonItem *barButtonItem, NSUInteger idx, BOOL *stop) {
    if (!barButtonItem.customView) return;
    UIView *view = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:barButtonItem.customView]];
    [_previousLeftButtonItemViews addObject:view];
  }];

  NSArray *previousRightItems = _previousViewController.navigationItem.rightBarButtonItems;
  _previousRightButtonItemViews = [NSMutableArray array];
  [previousRightItems enumerateObjectsUsingBlock:^(UIBarButtonItem *barButtonItem, NSUInteger idx, BOOL *stop) {
    if (!barButtonItem.customView) return;
    UIView *view = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:barButtonItem.customView]];
    [_previousRightButtonItemViews addObject:view];
  }];

  [_previousLeftButtonItemViews enumerateObjectsUsingBlock:^(UIView *previousButtonView, NSUInteger idx, BOOL *stop) {
    if (idx == _currentLeftButtonItems.count) {
      UIBarButtonItem *tmpBarButtonItem = [self createCurrentBarButtonItemWithFrame:previousButtonView.frame];
      _currentLeftButtonItems = [_currentLeftButtonItems arrayByAddingObject:tmpBarButtonItem];
      _currentViewController.navigationItem.leftBarButtonItems = _currentLeftButtonItems;
    }
    previousButtonView.frame = CGRectMake(0, 0, previousButtonView.frame.size.width, previousButtonView.frame.size.height);
    previousButtonView.alpha = 0.0;
    UIBarButtonItem *barButtonItem = _currentLeftButtonItems[idx];
    [barButtonItem.customView addSubview:previousButtonView];
  }];

  [_previousRightButtonItemViews enumerateObjectsUsingBlock:^(UIView *previousButtonView, NSUInteger idx, BOOL *stop) {
    if (idx == _currentRightButtonItems.count) {
      UIBarButtonItem *tmpBarButtonItem = [self createCurrentBarButtonItemWithFrame:previousButtonView.frame];
      _currentRightButtonItems = [_currentRightButtonItems arrayByAddingObject:tmpBarButtonItem];
      _currentViewController.navigationItem.rightBarButtonItems = _currentRightButtonItems;
    }
    previousButtonView.frame = CGRectMake(0, 0, previousButtonView.frame.size.width, previousButtonView.frame.size.height);
    previousButtonView.alpha = 0.0;
    UIBarButtonItem *barButtonItem = _currentRightButtonItems[idx];
    [barButtonItem.customView addSubview:previousButtonView];
  }];
}

- (UIBarButtonItem *)createCurrentBarButtonItemWithFrame:(CGRect)frame
{
  UIView *view = [[UIView alloc] initWithFrame:frame];
  [view addSubview:[[UIView alloc] initWithFrame:frame]];
  return [[UIBarButtonItem alloc] initWithCustomView:view];
}

#pragma mark - Gesture Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer;
{
  static float valve = 0;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    valve = tan(M_PI/6);
  });
  CGPoint translation = [gestureRecognizer translationInView:self.view];
  if (translation.x == 0) return NO;
  return fabs(translation.y / translation.x) < valve;
}


#pragma mark - Handle gesture states

- (void)moveViewAndChangeNavButtonsWithGestureRecognizer:(PanGestureRecognizer *)panGestureRecognizer
{
  CGPoint translationPoint = [panGestureRecognizer translationInView:_currentViewController.view];
  CGRect currentFrame = _currentViewController.view.frame;
  currentFrame.origin.x = _originalFrame.origin.x + translationPoint.x;
  if(currentFrame.origin.x<0){
    currentFrame.origin.x=0;
  }
  _currentViewController.view.frame = currentFrame;

  // fade bar button items
  float percentage = currentFrame.origin.x / currentFrame.size.width;
  [self setAlphaPercentageForBarButtonItems:percentage];

}

- (void)setAlphaPercentageForBarButtonItems:(float)percentage
{
  [_currentLeftButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem *barButtonItem, NSUInteger idx, BOOL *stop) {
    if (barButtonItem.customView.subviews.count > 0) {
      ((UIView *)barButtonItem.customView.subviews[0]).alpha = 1 - percentage;
    }
  }];

  [_currentRightButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem *barButtonItem, NSUInteger idx, BOOL *stop) {
    if (barButtonItem.customView.subviews.count > 0) {
      ((UIView *)barButtonItem.customView.subviews[0]).alpha = 1 - percentage;
    }
  }];

  [_previousLeftButtonItemViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
    view.alpha = percentage;
  }];

  [_previousRightButtonItemViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
    view.alpha = percentage;
  }];
}



- (void)handleSlideEndedWithRecognizer:(PanGestureRecognizer *)panGestureRecognizer
{
  if (!_currentViewController) return;
  CGPoint translationInView = [panGestureRecognizer translationInView:_currentViewController.view];
  CGPoint velocityInView = [panGestureRecognizer velocityInView:_currentViewController.view];
  CGFloat translationThreshold = _currentViewController.view.frame.size.width / 3;
  CGFloat velocityThreshold = 1000;

  if (panGestureRecognizer.direction == MSPanDirectionRight ||
    (translationInView.x < translationThreshold && velocityInView.x < velocityThreshold) ||
    _currentViewController.view.frame.origin.x < 0) {
    [self restoreToNormalState];
  }
  else {
    [UIView animateWithDuration:0.3 animations:^{
      CGRect frame = _currentViewController.view.frame;
      frame.origin.x = _currentViewController.view.frame.size.width;
      _currentViewController.view.frame = frame;
      [self setAlphaPercentageForBarButtonItems:1];

    } completion:^(BOOL finished) {
      [self popViewControllerAnimated:NO];
    }];
  }
}

#pragma mark - Clean up

- (void)restoreToNormalState
{
  [UIView animateWithDuration:0.3 animations:^{
    CGRect frame = _currentViewController.view.frame;
    frame.origin.x = 0;
    _currentViewController.view.frame = frame;
    [self setAlphaPercentageForBarButtonItems:0];
  }                completion:^(BOOL finished) {
    if ([_currentViewController.view isKindOfClass:[UIScrollView class]]) {
      [(UIScrollView*)_currentViewController.view setScrollEnabled:self.currentScrollViewWasEnabled];
    }
    [self removeScreenShots];
    [self clean];
  }];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  UIViewController *previousViewController = [self.viewControllers lastObject];
  if (previousViewController) {
    double delayInSeconds = animated?0.35:0.1; // 等按钮状态恢复到normal状态
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      UIImage *previousViewControllerScreenShot = [previousViewController.view screenShot];
      [self.screenShotStack addObject:previousViewControllerScreenShot];
    });
  }
  [super pushViewController:viewController animated:animated];
  BOOL supportSlideGoBack = previousViewController != nil;
  if ([viewController respondsToSelector:@selector(supportSlideGoBack)]) {
    supportSlideGoBack = [viewController supportSlideGoBack];
  }
  self.panGesture.enabled = supportSlideGoBack;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
  [self removeScreenShots];
  [self clean];
  [self.screenShotStack removeLastObject];
  
  BOOL supportSlideGoBack = YES;
  UIViewController *nextController = nil;
  if (self.viewControllers.count > 1) {
    nextController = self.viewControllers[self.viewControllers.count-2];
  }
  if ([nextController respondsToSelector:@selector(supportSlideGoBack)]) {
    supportSlideGoBack = [nextController supportSlideGoBack];
  }
  self.panGesture.enabled = supportSlideGoBack;
  
  return [super popViewControllerAnimated:animated];
}

- (void)removeScreenShots
{
  [_currentViewControllerImageView removeFromSuperview];
  [_previousViewControllerImageView removeFromSuperview];
}

- (void)clean
{
  _currentViewController = nil;
  _previousViewController = nil;
  _currentViewControllerImageView = nil;
//  _previousViewControllerImageView = nil;

  // clean bar button items
  [_previousLeftButtonItemViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
    [view removeFromSuperview];
  }];
  [_previousRightButtonItemViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
    [view removeFromSuperview];
  }];
  _previousLeftButtonItemViews = nil;
  _previousRightButtonItemViews = nil;
  _currentLeftButtonItems = nil;
  _currentRightButtonItems = nil;
}

@end