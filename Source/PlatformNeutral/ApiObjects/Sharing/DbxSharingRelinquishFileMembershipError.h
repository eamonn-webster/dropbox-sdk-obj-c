///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"

@class DbxSharingRelinquishFileMembershipError;
@class DbxSharingSharingFileAccessError;

/// 
/// The DbxSharingRelinquishFileMembershipError union.
/// 
@interface DbxSharingRelinquishFileMembershipError : NSObject <DbxSerializable> 

typedef NS_ENUM(NSInteger, SharingRelinquishFileMembershipErrorTag) {
    /// (no description)
    SharingRelinquishFileMembershipErrorAccessError,
    /// The current user has access to the shared file via a group.  You can't
    /// relinquish membership to a file shared via groups.
    SharingRelinquishFileMembershipErrorGroupAccess,
    /// The current user does not have permission to perform this action.
    SharingRelinquishFileMembershipErrorNoPermission,
    /// (no description)
    SharingRelinquishFileMembershipErrorOther,
};

- (nonnull instancetype)initWithAccessError:(DbxSharingSharingFileAccessError * _Nonnull)accessError;

- (nonnull instancetype)initWithGroupAccess;

- (nonnull instancetype)initWithNoPermission;

- (nonnull instancetype)initWithOther;

- (BOOL)isAccessError;

- (BOOL)isGroupAccess;

- (BOOL)isNoPermission;

- (BOOL)isOther;

- (NSString * _Nonnull)getTagName;

- (NSString * _Nonnull)description;

/// Current state of the DbxSharingRelinquishFileMembershipError union type.
@property (nonatomic) SharingRelinquishFileMembershipErrorTag tag;
@property (nonatomic) DbxSharingSharingFileAccessError * _Nonnull accessError;

@end


@interface DbxSharingRelinquishFileMembershipErrorSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxSharingRelinquishFileMembershipError * _Nonnull)obj;

+ (DbxSharingRelinquishFileMembershipError * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end