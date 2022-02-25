//
//  PhotoViewController.m
//  DBRoulette
//
//  Copyright © 2016 Dropbox. All rights reserved.
//

#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>

#import "PhotoViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface PhotoViewController ()

@property(weak, nonatomic) IBOutlet UIButton *randomPhotoButton;
@property(weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@property(nonatomic) UIImageView *currentImageView;

@end

@implementation PhotoViewController

- (IBAction)randomPhotoButtonPressed:(id)sender {
  [self setStarted];
  
  if (_currentImageView) {
    [_currentImageView removeFromSuperview];
  }

  DBUserClient *client = [DBClientsManager authorizedClient];

  NSString *searchPath = @"";

  // list folder metadata contents (folder will be root "/" Dropbox folder if app has permission
  // "Full Dropbox" or "/Apps/<APP_NAME>/" if app has permission "App Folder").
  [[client.filesRoutes listFolder:searchPath]
      setResponseBlock:^(DBFILESListFolderResult *result, DBFILESListFolderError *routeError, DBRequestError *error) {
        if (result) {
          [self displayPhotos:result.entries];
        } else {
          NSString *title = @"";
          NSString *message = @"";
          if (routeError) {
            // Route-specific request error
            title = @"Route-specific error";
            if ([routeError isPath]) {
              message = [NSString stringWithFormat:@"Invalid path: %@", routeError.path];
            }
          } else {
            // Generic request error
            title = @"Generic request error";
            if ([error isInternalServerError]) {
              DBRequestInternalServerError *internalServerError = [error asInternalServerError];
              message = [NSString stringWithFormat:@"%@", internalServerError];
            } else if ([error isBadInputError]) {
              DBRequestBadInputError *badInputError = [error asBadInputError];
              message = [NSString stringWithFormat:@"%@", badInputError];
            } else if ([error isAuthError]) {
              DBRequestAuthError *authError = [error asAuthError];
              message = [NSString stringWithFormat:@"%@", authError];
            } else if ([error isRateLimitError]) {
              DBRequestRateLimitError *rateLimitError = [error asRateLimitError];
              message = [NSString stringWithFormat:@"%@", rateLimitError];
            } else if ([error isHttpError]) {
              DBRequestHttpError *genericHttpError = [error asHttpError];
              message = [NSString stringWithFormat:@"%@", genericHttpError];
            } else if ([error isClientError]) {
              DBRequestClientError *genericLocalError = [error asClientError];
              message = [NSString stringWithFormat:@"%@", genericLocalError];
            }
          }

          UIAlertController *alertController =
              [UIAlertController alertControllerWithTitle:title
                                                  message:message
                                           preferredStyle:(UIAlertControllerStyle)UIAlertControllerStyleAlert];
          [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                              style:(UIAlertActionStyle)UIAlertActionStyleCancel
                                                            handler:nil]];
          [self presentViewController:alertController animated:YES completion:nil];

          [self setFinished];
        }
      }];
}

- (void)displayPhotos:(NSArray<DBFILESMetadata *> *)folderEntries {
  NSMutableArray<NSString *> *imagePaths = [NSMutableArray new];
  for (DBFILESMetadata *entry in folderEntries) {
    NSString *itemName = entry.name;
    if ([self isImageType:itemName]) {
      [imagePaths addObject:entry.pathDisplay];
    }
  }

  if ([imagePaths count] > 0) {
      int index = arc4random_uniform((int)[imagePaths count]);
      NSString *imagePathToDownload = imagePaths[index];
      // NSString *documentDirectory = NSHomeDirectory();
      NSString *documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
      NSString *cachedImagePath = [documentDirectory stringByAppendingString:imagePathToDownload];
      if ([[NSFileManager defaultManager] fileExistsAtPath:cachedImagePath isDirectory:false] ) {
          NSLog(@"using cached image: %@", imagePathToDownload);
          NSData *data = [[NSFileManager defaultManager] contentsAtPath:cachedImagePath];
          [self displayImage: data];
      }
      else {
          NSLog(@"downloading image: %@", imagePathToDownload);
          [self downloadImage:imagePathToDownload cachePath: cachedImagePath];
      }
  } else {
    NSString *title = @"No images found";
    NSString *message = @"There are currently no valid image files in the specified search path in your Dropbox. "
                        @"Please add some images and try again.";
    UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:message
                                     preferredStyle:(UIAlertControllerStyle)UIAlertControllerStyleAlert];
    [alertController
        addAction:[UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyle)UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    [self setFinished];
  }
}

- (BOOL)isImageType:(NSString *)itemName {
  NSRange range = [itemName rangeOfString:@"\\.jpeg|\\.jpg|\\.JPEG|\\.JPG|\\.png" options:NSRegularExpressionSearch];
  return range.location != NSNotFound;
}

- (void)downloadImage:(NSString *)imagePath cachePath:(NSString *)cacheImagePath {
  DBUserClient *client = [DBClientsManager authorizedClient];
  [[client.filesRoutes downloadData:imagePath]
      setResponseBlock:^(DBFILESFileMetadata *result, DBFILESDownloadError *routeError, DBRequestError *error, NSData *fileData) {
        if (result) {
          // [self validateDownloadData: fileData contentHash: result.contentHash];
          [self displayImage: fileData];
          NSLog(@"saving image: %@", cacheImagePath);
          NSError* error;
          // [fileData writeToFile:cacheImagePath atomically:YES];
          [fileData writeToFile:cacheImagePath options:NSDataWritingAtomic error:&error];

            if(error != nil) {
                    NSLog(@"write error %@", error);
            }
        } else {
          [self downloadRouteError: routeError error: error];
        }
        [self setFinished];
      }];
}

- (void)validateDownloadData:(NSData *)data contentHash: (NSString*)contentHash {
    NSString * computedHash = [self computeContentHash: data];
    NSLog(@"Dropbox  contentHash: '%@'", contentHash);
    NSLog(@"Computed contentHash: '%@'", computedHash);
}

- (NSString *)computeContentHash:(NSData *)data {
    long block_offset = 0;
    NSMutableData *hashes = [NSMutableData data];
    unsigned char digest[CC_SHA256_DIGEST_LENGTH] = {0};
    while (block_offset < data.length) {
        long block_length = data.length - block_offset;
        if (block_length > 0x400000) {
            block_length = 0x400000;
        }
        NSData* chunk = [NSData dataWithBytesNoCopy:(char *)[data bytes] + block_offset
                                                length:block_length
                                          freeWhenDone:NO];
        CC_SHA256(chunk.bytes, (CC_LONG)chunk.length, digest);
        [hashes appendBytes:digest length:CC_SHA256_DIGEST_LENGTH];
        block_offset += block_length;
    }
    CC_SHA256(hashes.bytes, (CC_LONG)hashes.length, digest);

    NSData *sha256Data = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];

    NSMutableString *str = [[NSMutableString alloc] init];
    const char *bytes = sha256Data.bytes;
    for (int i = 0; i < [sha256Data length]; i++) {
      [str appendFormat:@"%02hhx", bytes[i]];
    }
    return str;
}

- (void)displayImage:(NSData *)fileData {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:fileData]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(50, 50, 400, 400);
    [imageView setCenter:CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)];
    [self.view addSubview:imageView];
    _currentImageView = imageView;
}

- (void)downloadRouteError:(DBFILESDownloadError *)routeError error:(DBRequestError *)error {
    NSString *title = @"";
    NSString *message = @"";
    if (routeError) {
      // Route-specific request error
      title = @"Route-specific error";
      if ([routeError isPath]) {
        message = [NSString stringWithFormat:@"Invalid path: %@", routeError.path];
      } else if ([routeError isOther]) {
        message = [NSString stringWithFormat:@"Unknown error: %@", routeError];
      }
    } else {
      // Generic request error
      title = @"Generic request error";
      if ([error isInternalServerError]) {
        DBRequestInternalServerError *internalServerError = [error asInternalServerError];
        message = [NSString stringWithFormat:@"%@", internalServerError];
      } else if ([error isBadInputError]) {
        DBRequestBadInputError *badInputError = [error asBadInputError];
        message = [NSString stringWithFormat:@"%@", badInputError];
      } else if ([error isAuthError]) {
        DBRequestAuthError *authError = [error asAuthError];
        message = [NSString stringWithFormat:@"%@", authError];
      } else if ([error isRateLimitError]) {
        DBRequestRateLimitError *rateLimitError = [error asRateLimitError];
        message = [NSString stringWithFormat:@"%@", rateLimitError];
      } else if ([error isHttpError]) {
        DBRequestHttpError *genericHttpError = [error asHttpError];
        message = [NSString stringWithFormat:@"%@", genericHttpError];
      } else if ([error isClientError]) {
        DBRequestClientError *genericLocalError = [error asClientError];
        message = [NSString stringWithFormat:@"%@", genericLocalError];
      }
    }

    UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:message
                                     preferredStyle:(UIAlertControllerStyle)UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:(UIAlertActionStyle)UIAlertActionStyleCancel
                                                      handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setStarted {
  [_indicatorView startAnimating];
  _indicatorView.hidden = NO;
}

- (void)setFinished {
  [_indicatorView stopAnimating];
  _indicatorView.hidden = YES;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  _indicatorView.hidden = YES;
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
