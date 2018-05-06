
#import "XYFTools.h"

@implementation XYFTools


+ (NSDate *)dateFromString:(NSString *)datestring formate:(NSString *)formate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSDate *date = [dateFormatter dateFromString:datestring];
    
    
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date formate:(NSString *)formate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSString *datestring = [dateFormatter stringFromDate:date];

    return datestring;
}

+ (long long)countDirectorySize:(NSString *)directory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取到目录下面所有的文件名
    NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:directory error:nil];
    
    long long sum = 0;
    for (NSString *fileName in fileNames) {
        NSString *filePath = [directory stringByAppendingPathComponent:fileName];
        
        NSDictionary *attribute = [fileManager attributesOfItemAtPath:filePath error:nil];
        
        //        NSNumber *filesize = [attribute objectForKey:NSFileSize];
        long long size = [attribute fileSize];
        
        sum += size;
    }
    
    return sum;
}


//筛选数组中重复的数据
+ (NSMutableArray *)filterRepeatDataInArray:(NSArray *)elementArray
{
    NSMutableArray *temArray = [NSMutableArray arrayWithCapacity:elementArray.count];
    for (int i = 0; i < elementArray.count; i++)
    {
        bool bExsit = false;
        for (int j = 0; j < i; j++) {
            if ([elementArray[i] isEqualToString:elementArray[j]]) {
                bExsit = true;
                break;
            }
        }
        if (bExsit == false) {
            [temArray addObject:elementArray[i]];
        }
    }
    return temArray;
}

+ (void)addLocationNotificationWithAlertBody:(NSString *)alertBody AlertAction:(NSString *)alertAction
{
    //创建本地通知对象
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    //设置本地通知触发的时间点
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    //设置通知提示的内容
    localNotification.alertBody = alertBody;
    //设置通知alert上的按钮
    localNotification.alertAction = alertAction;
    localNotification.soundName = @"msgcome.wav";
    
    //    localNotification.hasAction = YES;
    //设置图标上显示的标记值
    //    localNotification.applicationIconBadgeNumber = 2;
    
    UIApplication *application = [UIApplication sharedApplication];
    //注册本地通知
    [application scheduleLocalNotification:localNotification];
}

//将字典转化为json
+ (NSString *)dicTransformToJson:(NSDictionary *)data
{
    NSError *err = nil;
    //将字典转成json
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&err];
    NSString *jsonString = @"";
    if ([jsonData length] > 0 && err == nil){
        //把json数据转化为String类型
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    return nil;
}

+ (double)intervalSinceNow:(NSString *)theDate
{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late = [d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    
    NSTimeInterval cha = now-late;
    return cha;
}

+ (UIColor *)transferHEXToRGB:(NSString *)HEX
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[HEX substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[HEX substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[HEX substringWithRange:range]]scanHexInt:&blue];
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    return color;
}



//16进制颜色字符串转为UIColor
+ (UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

//获取label的高度
+ (CGSize)getSizeWithLabel:(NSString *)des withFont:(UIFont *)font withSize:(CGSize)size
{
    if (![des isMemberOfClass:[NSNull class]]) {
        /** iOS6使用的方法
         CGSize size = [des sizeWithFont:font constrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];//MAXFLOAT
         NSLog(@"size.height:%f",size.height);
         return size;
         */
        NSDictionary *attribute = @{NSFontAttributeName: font};
        //iOS7中提供的计算文本尺寸的方法
        CGSize textSize1 = [des boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |
                            NSStringDrawingTruncatesLastVisibleLine  attributes:attribute context:nil].size;
        return textSize1;
    }
    return CGSizeZero;
}

+ (void)getVersionInfoWithAppid:(int)appid infoResult:(CheckVersionInfo)block
{
    NSString *urlstring = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%d",appid];
    urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstring]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (block != nil) {
            block(result);
        }
    }];
}

+ (NSString *)getDate:(NSString *)dateString formate:(NSString *)formate
{
    //设置时间
    NSRange range = NSMakeRange(0, 10);
    dateString = [dateString substringWithRange:range];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:dateString.longLongValue];
    NSString *timeStr = [XYFTools stringFromDate:date formate:formate];
    return timeStr;
}

#pragma mark - 正则匹配
// 邮箱
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:email];
}

// 手机
+ (BOOL)isValidatePhone:(NSString *)phone
{
    NSString *regex = @"^1[3458]{1}[\\d]{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phone];
}

+ (NSString *)matchSearchResultWithContent:(NSString *)content
                                    Search:(NSString *)search
                              resultLength:(NSInteger)length
{
    NSMutableString* temp_Content = [NSMutableString stringWithString:content];
    NSRange range = [temp_Content rangeOfString:search];
    
    if (temp_Content.length > 0) {
        
        if ((range.location + range.length) < length)   // 搜索内容在字符串前方
        {
            return temp_Content;
        }
        else if ((temp_Content.length - (range.location + range.length)) < length)  // 搜索内容在字符串最后面位置
        {
            return [temp_Content substringFromIndex:(temp_Content.length - 20)];
        }
        else    // 在字符串中间
        {
            return [temp_Content substringFromIndex:(range.location - 3)];
        }
    }
    
    return nil;
    
}

+ (NSMutableAttributedString *)stringFromContent:(NSString *)content Search:(NSString *)search
{
    NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:content];
    NSRange range = [content rangeOfString:search];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, range.location)];
    [str addAttribute:NSForegroundColorAttributeName value:[XYFTools transferHEXToRGB:@"39c631"] range:range];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:range];
    NSRange tempRange = NSMakeRange(range.location+range.length, str.length-(range.location+range.length));
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:tempRange];
    
    return str;
    
}

@end
