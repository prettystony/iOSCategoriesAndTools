#import <UIKit/UIKit.h>

/** UITabBar的高度 */
CGFloat const XYFTabBarH = 49;

/** 导航栏的最大Y值 */
CGFloat const XYFNavMaxY = 64;

/** 标题栏的高度 */
CGFloat const XYFTitlesViewH = 35;

/** 全局统一的间距 */
CGFloat const XYFMargin = 10;

/** 通用的小间距值 */
CGFloat const XYFSmallMargin = XYFMargin * 0.5;

/** 统一的一个请求路径 */
NSString  * const XYFCommonURL = @"http://www.baidu.com";

/** XYFUser - sex - male */
NSString * const XYFUserSexMale = @"m";

/** XYFUser - sex - female */
NSString * const XYFUserSexFemale = @"f";

/** TabBarButton被重复点击的通知 */
NSString  * const XYFTabBarButtonDidRepeatClickNotification = @"XYFTabBarButtonDidRepeatClickNotification";

/** TitleButton被重复点击的通知 */
NSString  * const XYFTitleButtonDidRepeatClickNotification = @"XYFTitleButtonDidRepeatClickNotification";
