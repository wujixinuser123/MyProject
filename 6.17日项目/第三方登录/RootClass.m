//
//	RootClass.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "RootClass.h"

@interface RootClass ()
@end
@implementation RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"CommodityText"] isKindOfClass:[NSNull class]]){
		self.commodityText = dictionary[@"CommodityText"];
	}	
	if(![dictionary[@"IfMiddlePage"] isKindOfClass:[NSNull class]]){
		self.ifMiddlePage = dictionary[@"IfMiddlePage"];
	}	
	if(![dictionary[@"ImgView"] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[@"ImgView"];
	}	
	if(![dictionary[@"RelatedId"] isKindOfClass:[NSNull class]]){
		self.relatedId = dictionary[@"RelatedId"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.commodityText != nil){
		dictionary[@"CommodityText"] = self.commodityText;
	}
	if(self.ifMiddlePage != nil){
		dictionary[@"IfMiddlePage"] = self.ifMiddlePage;
	}
	if(self.imgView != nil){
		dictionary[@"ImgView"] = self.imgView;
	}
	if(self.relatedId != nil){
		dictionary[@"RelatedId"] = self.relatedId;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.commodityText != nil){
		[aCoder encodeObject:self.commodityText forKey:@"CommodityText"];
	}
	if(self.ifMiddlePage != nil){
		[aCoder encodeObject:self.ifMiddlePage forKey:@"IfMiddlePage"];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:@"ImgView"];
	}
	if(self.relatedId != nil){
		[aCoder encodeObject:self.relatedId forKey:@"RelatedId"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.commodityText = [aDecoder decodeObjectForKey:@"CommodityText"];
	self.ifMiddlePage = [aDecoder decodeObjectForKey:@"IfMiddlePage"];
	self.imgView = [aDecoder decodeObjectForKey:@"ImgView"];
	self.relatedId = [aDecoder decodeObjectForKey:@"RelatedId"];
	return self;

}
@end