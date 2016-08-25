///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>
#import "DbxStoneSerializers.h"

@class DbxFilesDownloadError;
@class DbxFilesLookupError;

/// 
/// The DbxFilesDownloadError union.
/// 
@interface DbxFilesDownloadError : NSObject <DbxSerializable> 

typedef NS_ENUM(NSInteger, FilesDownloadErrorTag) {
    /// (no description)
    FilesDownloadErrorPath,
    /// (no description)
    FilesDownloadErrorOther,
};

- (nonnull instancetype)initWithPath:(DbxFilesLookupError * _Nonnull)path;

- (nonnull instancetype)initWithOther;

- (BOOL)isPath;

- (BOOL)isOther;

- (NSString * _Nonnull)getTagName;

- (NSString * _Nonnull)description;

/// Current state of the DbxFilesDownloadError union type.
@property (nonatomic) FilesDownloadErrorTag tag;
@property (nonatomic) DbxFilesLookupError * _Nonnull path;

@end


@interface DbxFilesDownloadErrorSerializer : NSObject 

+ (NSDictionary * _Nonnull)serialize:(DbxFilesDownloadError * _Nonnull)obj;

+ (DbxFilesDownloadError * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end