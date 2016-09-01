//
//  MTDataManager.h
//  Steven Koposov
//
//  Created by Steven Koposov on 05/6/16.
//  Copyright (c) 2016 Steven Koposov . All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^MTProgressBlock)(NSInteger progressCount, NSInteger totalCount);
typedef void(^MTCompletionBlock)(id responseObject, ...);
typedef void(^MTCompletionWithMessageBlock)(id responseObject, NSString *message, ...);
typedef void(^MTFailureBlock)(id returnedObject, ...);
typedef void(^SimpleBlock)();


@interface MTDataManager : NSObject

+ (instancetype)sharedInstance;

- (void)binGetSampleRequestWithOwner:(id)classOwner
                          complition:(MTCompletionBlock)completion
                             failure:(MTFailureBlock)failure;

- (void)binGetSample2RequestWithOwner:(id)classOwner
                           completion:(void (^)(NSString *url,
                                                NSString *origin))completion
                              failure:(MTFailureBlock)failure;

#pragma mark - REQUSEST TO SERVER & DATABASE RESPONSE

@end