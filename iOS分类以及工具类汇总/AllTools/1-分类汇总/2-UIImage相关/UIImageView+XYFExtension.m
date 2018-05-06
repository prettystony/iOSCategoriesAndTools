

#import "UIImageView+XYFExtension.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Image.h"

@implementation UIImageView (XYFExtension)
    
- (void)setHeader:(NSString *)url
{
    [self setCircleHeader:url];
}

- (void)setCircleHeader:(NSString *)url
{
    UIImage *placeholder = [UIImage circleImageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
        self.image = [image circleImage];
    }];
}

- (void)setRectHeader:(NSString *)url
{
    UIImage *placeholder = [UIImage imageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}
    
@end
