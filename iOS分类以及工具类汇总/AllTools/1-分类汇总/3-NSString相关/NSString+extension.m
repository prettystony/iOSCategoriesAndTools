

#import "NSString+extension.h"

@implementation NSString (extension)

- (instancetype)cacheDir
{
    // 1.获取caches目录
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    // 2.生成绝对路径
    return [path stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)docDir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)tmpDir
{
    NSString *path = NSTemporaryDirectory();
    return [path stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
