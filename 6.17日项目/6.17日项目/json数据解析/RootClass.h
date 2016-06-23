#import <UIKit/UIKit.h>

@interface RootClass : NSObject

@property (nonatomic, copy) NSString * commodityText;
@property (nonatomic, copy) NSString * ifMiddlePage;
@property (nonatomic, copy) NSString * imgView;
@property (nonatomic, copy) NSString * relatedId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end