///
/// Auto-generated by Stone, do not modify.
///

#import "DbxSharingInsufficientQuotaAmounts.h"
#import "DbxStoneSerializers.h"
#import "DbxStoneValidators.h"

@implementation DbxSharingInsufficientQuotaAmounts 

- (instancetype)initWithSpaceNeeded:(NSNumber *)spaceNeeded spaceShortage:(NSNumber *)spaceShortage spaceLeft:(NSNumber *)spaceLeft {

    self = [super init];
    if (self != nil) {
        _spaceNeeded = spaceNeeded;
        _spaceShortage = spaceShortage;
        _spaceLeft = spaceLeft;
    }
    return self;
}

+ (NSDictionary *)serialize:(id)obj {
    return [DbxSharingInsufficientQuotaAmountsSerializer serialize:obj];
}

+ (id)deserialize:(NSDictionary *)dict {
    return [DbxSharingInsufficientQuotaAmountsSerializer deserialize:dict];
}

- (NSString *)description {
    return [[DbxSharingInsufficientQuotaAmountsSerializer serialize:self] description];
}

@end


@implementation DbxSharingInsufficientQuotaAmountsSerializer 

+ (NSDictionary *)serialize:(DbxSharingInsufficientQuotaAmounts *)valueObj {
    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

    jsonDict[@"space_needed"] = valueObj.spaceNeeded;
    jsonDict[@"space_shortage"] = valueObj.spaceShortage;
    jsonDict[@"space_left"] = valueObj.spaceLeft;

    return jsonDict;
}

+ (DbxSharingInsufficientQuotaAmounts *)deserialize:(NSDictionary *)valueDict {
    NSNumber *spaceNeeded = valueDict[@"space_needed"];
    NSNumber *spaceShortage = valueDict[@"space_shortage"];
    NSNumber *spaceLeft = valueDict[@"space_left"];

    return [[DbxSharingInsufficientQuotaAmounts alloc] initWithSpaceNeeded:spaceNeeded spaceShortage:spaceShortage spaceLeft:spaceLeft];
}

@end