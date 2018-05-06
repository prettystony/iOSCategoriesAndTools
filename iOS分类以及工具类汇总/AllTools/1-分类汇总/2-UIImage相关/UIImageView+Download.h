
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (Download)
    
- (void)xyf_setOriginImage:(NSString *)originImageURL thumbnailImage:(NSString *)thumbnailImageURL placeholder:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock;

- (void)xyf_setHeader:(NSString *)headerUrl;
    
@end
