///
/// Auto-generated by Stone, do not modify.
///

#import "DbxSharingListFolderMembersArgs.h"
#import "DbxSharingListFolderMembersCursorArg.h"
#import "DbxSharingMemberAction.h"
#import "DbxStoneSerializers.h"
#import "DbxStoneValidators.h"

@implementation DbxSharingListFolderMembersArgs 

- (instancetype)initWithSharedFolderId:(NSString *)sharedFolderId actions:(NSArray<DbxSharingMemberAction *> *)actions limit:(NSNumber *)limit {
    [DbxStoneValidators stringValidator:nil maxLength:nil pattern:@"[-_0-9a-zA-Z:]+"](sharedFolderId);
    [DbxStoneValidators nullableValidator:[DbxStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil]](actions);
    [DbxStoneValidators numericValidator:[NSNumber numberWithInt:1] maxValue:[NSNumber numberWithInt:1000]](limit ?: [NSNumber numberWithUnsignedInt:1000]);

    self = [super initWithActions:actions limit:limit];
    if (self != nil) {
        _sharedFolderId = sharedFolderId;
    }
    return self;
}

- (instancetype)initWithSharedFolderId:(NSString *)sharedFolderId {
    return [self initWithSharedFolderId:sharedFolderId actions:nil limit:nil];
}

+ (NSDictionary *)serialize:(id)obj {
    return [DbxSharingListFolderMembersArgsSerializer serialize:obj];
}

+ (id)deserialize:(NSDictionary *)dict {
    return [DbxSharingListFolderMembersArgsSerializer deserialize:dict];
}

- (NSString *)description {
    return [[DbxSharingListFolderMembersArgsSerializer serialize:self] description];
}

@end


@implementation DbxSharingListFolderMembersArgsSerializer 

+ (NSDictionary *)serialize:(DbxSharingListFolderMembersArgs *)valueObj {
    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

    jsonDict[@"shared_folder_id"] = valueObj.sharedFolderId;
    if (valueObj.actions) {
        jsonDict[@"actions"] = [DbxArraySerializer serialize:valueObj.actions withBlock:^id(id elem) { return [DbxSharingMemberActionSerializer serialize:elem]; }];
    }
    jsonDict[@"limit"] = valueObj.limit;

    return jsonDict;
}

+ (DbxSharingListFolderMembersArgs *)deserialize:(NSDictionary *)valueDict {
    NSString *sharedFolderId = valueDict[@"shared_folder_id"];
    NSArray<DbxSharingMemberAction *> *actions = valueDict[@"actions"] ? [DbxArraySerializer deserialize:valueDict[@"actions"] withBlock:^id(id elem) { return [DbxSharingMemberActionSerializer deserialize:elem]; }] : nil;
    NSNumber *limit = valueDict[@"limit"];

    return [[DbxSharingListFolderMembersArgs alloc] initWithSharedFolderId:sharedFolderId actions:actions limit:limit];
}

@end