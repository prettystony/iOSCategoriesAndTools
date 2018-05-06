
#import "XYFExtensionConfig.h"
#import "MJExtension.h"

@implementation XYFExtensionConfig

+ (void)load {
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"description",
                 // @"ID" : @"id",
                 @"name" : @[@"name", @"screenname"],
                 @"info" : @[@"other.info[1].abc",
                             @"other.info[0].test",
                             @"name"]
                 };
    }];
    
    [NSObject mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"dogs" : @"XYFDog",
                 @"books" : @"XYFBook"
                 };
    }];
    
    [NSObject mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        // if ([propertyName isEqualToString:@"ID"]) return @"id";
        return [propertyName mj_underlineFromCamel];
    }];
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
}

@end
