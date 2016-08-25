///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"
#import "DbxTeamGroupMemberSelector.h"

@class DbxTeamGroupAccessType;
@class DbxTeamGroupMembersSetAccessTypeArg;
@class DbxTeamGroupSelector;
@class DbxTeamUserSelectorArg;

/// 
/// The DbxTeamGroupMembersSetAccessTypeArg struct.
/// 
@interface DbxTeamGroupMembersSetAccessTypeArg : DbxTeamGroupMemberSelector <DbxSerializable> 

/// New group access type the user will have.
@property (nonatomic) DbxTeamGroupAccessType * _Nonnull accessType;
/// Whether to return the list of members in the group.  Note that the default
/// value will cause all the group members  to be returned in the response. This
/// may take a long time for large groups.
@property (nonatomic, copy) NSNumber * _Nonnull returnMembers;

- (nonnull instancetype)initWithGroup:(DbxTeamGroupSelector * _Nonnull)group user:(DbxTeamUserSelectorArg * _Nonnull)user accessType:(DbxTeamGroupAccessType * _Nonnull)accessType returnMembers:(NSNumber * _Nullable)returnMembers;

- (nonnull instancetype)initWithGroup:(DbxTeamGroupSelector * _Nonnull)group user:(DbxTeamUserSelectorArg * _Nonnull)user accessType:(DbxTeamGroupAccessType * _Nonnull)accessType;

- (NSString * _Nonnull)description;

@end


@interface DbxTeamGroupMembersSetAccessTypeArgSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxTeamGroupMembersSetAccessTypeArg * _Nonnull)obj;

+ (DbxTeamGroupMembersSetAccessTypeArg * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end