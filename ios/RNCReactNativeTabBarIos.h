#import <UIKit/UIKit.h>

@interface RNCReactNativeTabBarIos : UIView

@property (nonatomic, strong) UIColor *unselectedTintColor;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, assign) BOOL translucent;
#if !TARGET_OS_TV
@property (nonatomic, assign) UIBarStyle barStyle;
#endif

- (void)uiManagerDidPerformMounting;

@end
