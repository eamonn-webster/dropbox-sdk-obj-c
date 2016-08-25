///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"

@class DbxTeamRevokeDeviceSessionError;

/// 
/// The DbxTeamRevokeDeviceSessionError union.
/// 
@interface DbxTeamRevokeDeviceSessionError : NSObject <DbxSerializable> 

typedef NS_ENUM(NSInteger, TeamRevokeDeviceSessionErrorTag) {
    /// Device session not found.
    TeamRevokeDeviceSessionErrorDeviceSessionNotFound,
    /// Member not found.
    TeamRevokeDeviceSessionErrorMemberNotFound,
    /// (no description)
    TeamRevokeDeviceSessionErrorOther,
};

- (nonnull instancetype)initWithDeviceSessionNotFound;

- (nonnull instancetype)initWithMemberNotFound;

- (nonnull instancetype)initWithOther;

- (BOOL)isDeviceSessionNotFound;

- (BOOL)isMemberNotFound;

- (BOOL)isOther;

- (NSString * _Nonnull)getTagName;

- (NSString * _Nonnull)description;

/// Current state of the DbxTeamRevokeDeviceSessionError union type.
@property (nonatomic) TeamRevokeDeviceSessionErrorTag tag;

@end


@interface DbxTeamRevokeDeviceSessionErrorSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxTeamRevokeDeviceSessionError * _Nonnull)obj;

+ (DbxTeamRevokeDeviceSessionError * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end