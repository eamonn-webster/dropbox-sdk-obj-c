/// 
/// Stone Route Objects
/// 

#import "DbxStoneBase.h"
#import "DbxUsersRouteObjects.h"
#import "DbxUsersRoutes.h"

@implementation DbxUsersRouteObjects 

static DbxRoute *dbxUsersGetAccount = nil;
static DbxRoute *dbxUsersGetAccountBatch = nil;
static DbxRoute *dbxUsersGetCurrentAccount = nil;
static DbxRoute *dbxUsersGetSpaceUsage = nil;

+ (DbxRoute *)dbxUsersGetAccount {
    if (!dbxUsersGetAccount) {
        dbxUsersGetAccount = [[DbxRoute alloc] init:
            @"get_account"
            namespace_:@"users"
            deprecated:@NO
            resultType:[DbxUsersBasicAccount class]
            errorType:[DbxUsersGetAccountError class]
            attrs:@{@"host": @"api",
                    @"style": @"rpc"}
            arraySerialBlock:nil
            arrayDeserialBlock:nil
        ];
    }
    return dbxUsersGetAccount;
}

+ (DbxRoute *)dbxUsersGetAccountBatch {
    if (!dbxUsersGetAccountBatch) {
        dbxUsersGetAccountBatch = [[DbxRoute alloc] init:
            @"get_account_batch"
            namespace_:@"users"
            deprecated:@NO
            resultType:[NSArray<DbxUsersBasicAccount *> class]
            errorType:[DbxUsersGetAccountBatchError class]
            attrs:@{@"host": @"api",
                    @"style": @"rpc"}
            arraySerialBlock:nil
            arrayDeserialBlock:^id(id array) { return [DbxArraySerializer deserialize:array withBlock:^id(id elem) { return [DbxUsersBasicAccountSerializer deserialize:elem]; }]; }
        ];
    }
    return dbxUsersGetAccountBatch;
}

+ (DbxRoute *)dbxUsersGetCurrentAccount {
    if (!dbxUsersGetCurrentAccount) {
        dbxUsersGetCurrentAccount = [[DbxRoute alloc] init:
            @"get_current_account"
            namespace_:@"users"
            deprecated:@NO
            resultType:[DbxUsersFullAccount class]
            errorType:nil
            attrs:@{@"host": @"api",
                    @"style": @"rpc"}
            arraySerialBlock:nil
            arrayDeserialBlock:nil
        ];
    }
    return dbxUsersGetCurrentAccount;
}

+ (DbxRoute *)dbxUsersGetSpaceUsage {
    if (!dbxUsersGetSpaceUsage) {
        dbxUsersGetSpaceUsage = [[DbxRoute alloc] init:
            @"get_space_usage"
            namespace_:@"users"
            deprecated:@NO
            resultType:[DbxUsersSpaceUsage class]
            errorType:nil
            attrs:@{@"host": @"api",
                    @"style": @"rpc"}
            arraySerialBlock:nil
            arrayDeserialBlock:nil
        ];
    }
    return dbxUsersGetSpaceUsage;
}

@end