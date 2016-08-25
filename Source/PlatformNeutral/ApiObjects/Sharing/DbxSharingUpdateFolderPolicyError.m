///
/// Auto-generated by Stone, do not modify.
///

#import "DbxSharingSharedFolderAccessError.h"
#import "DbxSharingUpdateFolderPolicyError.h"
#import "DbxStoneSerializers.h"
#import "DbxStoneValidators.h"

@implementation DbxSharingUpdateFolderPolicyError 

- (instancetype)initWithAccessError:(DbxSharingSharedFolderAccessError *)accessError {
    self = [super init];
    if (self != nil) {
        _tag = (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorAccessError;
        _accessError = accessError;
    }
    return self;
}

- (instancetype)initWithNotOnTeam {
    self = [super init];
    if (self != nil) {
        _tag = (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNotOnTeam;
    }
    return self;
}

- (instancetype)initWithTeamPolicyDisallowsMemberPolicy {
    self = [super init];
    if (self != nil) {
        _tag = (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorTeamPolicyDisallowsMemberPolicy;
    }
    return self;
}

- (instancetype)initWithDisallowedSharedLinkPolicy {
    self = [super init];
    if (self != nil) {
        _tag = (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorDisallowedSharedLinkPolicy;
    }
    return self;
}

- (instancetype)initWithNoPermission {
    self = [super init];
    if (self != nil) {
        _tag = (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNoPermission;
    }
    return self;
}

- (instancetype)initWithOther {
    self = [super init];
    if (self != nil) {
        _tag = (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorOther;
    }
    return self;
}

- (BOOL)isAccessError {
    return _tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorAccessError;
}

- (BOOL)isNotOnTeam {
    return _tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNotOnTeam;
}

- (BOOL)isTeamPolicyDisallowsMemberPolicy {
    return _tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorTeamPolicyDisallowsMemberPolicy;
}

- (BOOL)isDisallowedSharedLinkPolicy {
    return _tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorDisallowedSharedLinkPolicy;
}

- (BOOL)isNoPermission {
    return _tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNoPermission;
}

- (BOOL)isOther {
    return _tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorOther;
}

- (NSString *)getTagName {
    if (_tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorAccessError) {
        return @"(SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorAccessError";
    }
    if (_tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNotOnTeam) {
        return @"(SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNotOnTeam";
    }
    if (_tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorTeamPolicyDisallowsMemberPolicy) {
        return @"(SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorTeamPolicyDisallowsMemberPolicy";
    }
    if (_tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorDisallowedSharedLinkPolicy) {
        return @"(SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorDisallowedSharedLinkPolicy";
    }
    if (_tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNoPermission) {
        return @"(SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorNoPermission";
    }
    if (_tag == (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorOther) {
        return @"(SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorOther";
    }

    @throw([NSException exceptionWithName:@"InvalidTagEnum" reason:@"Supplied tag enum has an invalid value." userInfo:nil]);
}

- (DbxSharingSharedFolderAccessError *)accessError {
    if (_tag != (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorAccessError) {
        [NSException raise:@"IllegalStateException" format:@"Invalid tag: required (SharingUpdateFolderPolicyErrorTag)SharingUpdateFolderPolicyErrorAccessError, but was %@.", [self getTagName]];
    }
    return _accessError;
}

+ (NSDictionary *)serialize:(id)obj {
    return [DbxSharingUpdateFolderPolicyErrorSerializer serialize:obj];
}

+ (id)deserialize:(NSDictionary *)dict {
    return [DbxSharingUpdateFolderPolicyErrorSerializer deserialize:dict];
}

- (NSString *)description {
    return [[DbxSharingUpdateFolderPolicyErrorSerializer serialize:self] description];
}

@end


@implementation DbxSharingUpdateFolderPolicyErrorSerializer 

+ (NSDictionary *)serialize:(DbxSharingUpdateFolderPolicyError *)valueObj {
    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

    if ([valueObj isAccessError]) {
        jsonDict = [[DbxSharingSharedFolderAccessErrorSerializer serialize:valueObj.accessError] mutableCopy];
        jsonDict[@".tag"] = @"access_error";
    }
    else if ([valueObj isNotOnTeam]) {
        jsonDict[@".tag"] = @"not_on_team";
    }
    else if ([valueObj isTeamPolicyDisallowsMemberPolicy]) {
        jsonDict[@".tag"] = @"team_policy_disallows_member_policy";
    }
    else if ([valueObj isDisallowedSharedLinkPolicy]) {
        jsonDict[@".tag"] = @"disallowed_shared_link_policy";
    }
    else if ([valueObj isNoPermission]) {
        jsonDict[@".tag"] = @"no_permission";
    }
    else if ([valueObj isOther]) {
        jsonDict[@".tag"] = @"other";
    }
    else {
        @throw([NSException exceptionWithName:@"InvalidTagEnum" reason:@"Supplied tag enum has an invalid value." userInfo:nil]);
    }

    return jsonDict;
}

+ (DbxSharingUpdateFolderPolicyError *)deserialize:(NSDictionary *)valueDict {
    NSString *tag = valueDict[@".tag"];

    if ([tag isEqualToString:@"access_error"]) {
        DbxSharingSharedFolderAccessError *accessError = [DbxSharingSharedFolderAccessErrorSerializer deserialize:valueDict[@"access_error"]];
        return [[DbxSharingUpdateFolderPolicyError alloc] initWithAccessError:accessError];
    }
    if ([tag isEqualToString:@"not_on_team"]) {
        return [[DbxSharingUpdateFolderPolicyError alloc] initWithNotOnTeam];
    }
    if ([tag isEqualToString:@"team_policy_disallows_member_policy"]) {
        return [[DbxSharingUpdateFolderPolicyError alloc] initWithTeamPolicyDisallowsMemberPolicy];
    }
    if ([tag isEqualToString:@"disallowed_shared_link_policy"]) {
        return [[DbxSharingUpdateFolderPolicyError alloc] initWithDisallowedSharedLinkPolicy];
    }
    if ([tag isEqualToString:@"no_permission"]) {
        return [[DbxSharingUpdateFolderPolicyError alloc] initWithNoPermission];
    }
    if ([tag isEqualToString:@"other"]) {
        return [[DbxSharingUpdateFolderPolicyError alloc] initWithOther];
    }

    @throw([NSException exceptionWithName:@"InvalidTagEnum" reason:@"Supplied tag enum has an invalid value." userInfo:nil]);
}

@end