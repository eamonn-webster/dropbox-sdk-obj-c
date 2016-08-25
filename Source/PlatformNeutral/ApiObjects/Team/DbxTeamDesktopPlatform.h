///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"

@class DbxTeamDesktopPlatform;

/// 
/// The DbxTeamDesktopPlatform union.
/// 
@interface DbxTeamDesktopPlatform : NSObject <DbxSerializable> 

typedef NS_ENUM(NSInteger, TeamDesktopPlatformTag) {
    /// Official Windows Dropbox desktop client
    TeamDesktopPlatformWindows,
    /// Official Mac Dropbox desktop client
    TeamDesktopPlatformMac,
    /// Official Linux Dropbox desktop client
    TeamDesktopPlatformLinux,
    /// (no description)
    TeamDesktopPlatformOther,
};

- (nonnull instancetype)initWithWindows;

- (nonnull instancetype)initWithMac;

- (nonnull instancetype)initWithLinux;

- (nonnull instancetype)initWithOther;

- (BOOL)isWindows;

- (BOOL)isMac;

- (BOOL)isLinux;

- (BOOL)isOther;

- (NSString * _Nonnull)getTagName;

- (NSString * _Nonnull)description;

/// Current state of the DbxTeamDesktopPlatform union type.
@property (nonatomic) TeamDesktopPlatformTag tag;

@end


@interface DbxTeamDesktopPlatformSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxTeamDesktopPlatform * _Nonnull)obj;

+ (DbxTeamDesktopPlatform * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end