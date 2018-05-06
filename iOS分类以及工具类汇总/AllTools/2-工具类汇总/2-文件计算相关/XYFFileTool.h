
#import <Foundation/Foundation.h>

/*
 业务类:以后开发中用来专门处理某件事情,网络处理,缓存处理
 */

@interface XYFFileTool : NSObject

/**
 *  获取文件夹尺寸
 *
 *  @param directoryPath 文件夹路径
 *
 *  @返回文件夹尺寸
 */
+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger))completion;


/**
 *  删除文件夹所有文件
 *
 *  @param directoryPath 文件夹路径
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;

/// Returns "Documents" folder in this app's sandbox.
NSString *NSDocumentsPath(void);

/// Returns "Library" folder in this app's sandbox.
NSString *NSLibraryPath(void);

/// Returns "Caches" folder in this app's sandbox.
NSString *NSCachesPath(void);
@end
