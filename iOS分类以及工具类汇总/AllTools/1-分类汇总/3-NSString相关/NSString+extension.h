

#import <Foundation/Foundation.h>

@interface NSString (extension)

// 用于生成文件在caches目录中的路径
- (instancetype)cacheDir;

// 用于生成文件在document目录中的路径
- (instancetype)docDir;

// 用于生成文件在tmp目录中的路径
- (instancetype)tmpDir;

@end
