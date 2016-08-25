///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"

@class DbxSharingMemberAction;
@class DbxSharingMemberPermission;
@class DbxSharingPermissionDeniedReason;

/// 
/// The DbxSharingMemberPermission struct.
/// 
/// Whether the user is allowed to take the action on the associated member.
/// 
@interface DbxSharingMemberPermission : NSObject <DbxSerializable> 

/// The action that the user may wish to take on the member.
@property (nonatomic) DbxSharingMemberAction * _Nonnull action;
/// True if the user is allowed to take the action.
@property (nonatomic, copy) NSNumber * _Nonnull allow;
/// The reason why the user is denied the permission. Not present if the action
/// is allowed
@property (nonatomic) DbxSharingPermissionDeniedReason * _Nullable reason;

- (nonnull instancetype)initWithAction:(DbxSharingMemberAction * _Nonnull)action allow:(NSNumber * _Nonnull)allow reason:(DbxSharingPermissionDeniedReason * _Nullable)reason;

- (nonnull instancetype)initWithAction:(DbxSharingMemberAction * _Nonnull)action allow:(NSNumber * _Nonnull)allow;

- (NSString * _Nonnull)description;

@end


@interface DbxSharingMemberPermissionSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxSharingMemberPermission * _Nonnull)obj;

+ (DbxSharingMemberPermission * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end