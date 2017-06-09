///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESUploadSessionStartResult;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `UploadSessionStartResult` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESUploadSessionStartResult : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// A unique identifier for the upload session. Pass this to
/// `uploadSessionAppendV2` and `uploadSessionFinish`.
@property (nonatomic, readonly, copy) NSString *sessionId;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param sessionId A unique identifier for the upload session. Pass this to
/// `uploadSessionAppendV2` and `uploadSessionFinish`.
///
/// @return An initialized instance.
///
- (instancetype)initWithSessionId:(NSString *)sessionId;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `UploadSessionStartResult` struct.
///
@interface DBFILESUploadSessionStartResultSerializer : NSObject

///
/// Serializes `DBFILESUploadSessionStartResult` instances.
///
/// @param instance An instance of the `DBFILESUploadSessionStartResult` API
/// object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESUploadSessionStartResult` API object.
///
+ (NSDictionary *)serialize:(DBFILESUploadSessionStartResult *)instance;

///
/// Deserializes `DBFILESUploadSessionStartResult` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESUploadSessionStartResult` API object.
///
/// @return An instantiation of the `DBFILESUploadSessionStartResult` object.
///
+ (DBFILESUploadSessionStartResult *)deserialize:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END