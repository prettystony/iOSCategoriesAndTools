

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XYFTools : NSObject

typedef void(^CheckVersionInfo)(id result);

//将字符串格式化为Date对象
+ (NSDate *)dateFromString:(NSString *)datestring formate:(NSString *)formate;

//将日期格式化为NSString对象
+ (NSString *)stringFromDate:(NSDate *)date formate:(NSString *)formate;

//计算目录下面所有文件的大小
+ (long long)countDirectorySize:(NSString *)directory;

//筛选数组中重复的数据,elementArray为原数组，返回为筛选之后的数据
+ (NSMutableArray *)filterRepeatDataInArray:(NSArray *)elementArray;

//添加本地通知
+ (void)addLocationNotificationWithAlertBody:(NSString *)alertBody AlertAction:(NSString *)alertAction;

//将字典转化为json
+ (NSString *)dicTransformToJson:(NSDictionary *)data;

//计算某一时间与当前时间的差值
+ (double)intervalSinceNow:(NSString *)theDate;

//16进制颜色字符串转为UIColor
+ (UIColor *)hexStringToColor:(NSString *)stringToConvert;

/**描述：将十六进制颜色值转化为rgb值
 参数：HEX，是十六进制值，不需要写#
 返回值：UIColor
 **/
+ (UIColor *)transferHEXToRGB:(NSString *)HEX;

/**
 描述：根据文本来计算高度
 参数：des是需要计算的文本高度,font是文本的字体，size是文本预定的大小
 返回值：文本的大小
 **/
+ (CGSize)getSizeWithLabel:(NSString *)des withFont:(UIFont *)font withSize:(CGSize)size;

/**
 描述：根据appId获取当前应用的版本信息
 参数：appid
 **/
+ (void)getVersionInfoWithAppid:(int)appid infoResult:(CheckVersionInfo)block;

/*
 描述：时间戳转换成日期
 参数：dateString:时间戳 formate：格式
 */
+ (NSString *)getDate:(NSString *)dateString formate:(NSString *)formate;


/**
 *  正则匹配邮箱
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 *  正则匹配手机号
 */
+ (BOOL)isValidatePhone:(NSString *)phone;

/**
 *  匹配搜索关键字算法
 */

+ (NSString *)matchSearchResultWithContent:(NSString *)content
                                    Search:(NSString *)search
                              resultLength:(NSInteger)length;
/**
 *  label显示不同的颜色
 */

+ (NSMutableAttributedString *)stringFromContent:(NSString *)content Search:(NSString *)search;



@end
