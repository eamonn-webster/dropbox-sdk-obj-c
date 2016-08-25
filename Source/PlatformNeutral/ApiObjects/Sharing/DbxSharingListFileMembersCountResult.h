///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"

@class DbxSharingListFileMembersCountResult;
@class DbxSharingSharedFileMembers;

/// 
/// The DbxSharingListFileMembersCountResult struct.
/// 
@interface DbxSharingListFileMembersCountResult : NSObject <DbxSerializable> 

/// A list of members on this file.
@property (nonatomic) DbxSharingSharedFileMembers * _Nonnull members;
/// The number of members on this file. This does not include inherited members
@property (nonatomic, copy) NSNumber * _Nonnull memberCount;

- (nonnull instancetype)initWithMembers:(DbxSharingSharedFileMembers * _Nonnull)members memberCount:(NSNumber * _Nonnull)memberCount;

- (NSString * _Nonnull)description;

@end


@interface DbxSharingListFileMembersCountResultSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxSharingListFileMembersCountResult * _Nonnull)obj;

+ (DbxSharingListFileMembersCountResult * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end