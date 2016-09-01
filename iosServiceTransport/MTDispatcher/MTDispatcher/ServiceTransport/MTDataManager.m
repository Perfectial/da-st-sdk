//
//  MTDataManager.m
//  Steven Koposov
//
//  Created by Steven Koposov on 05/6/16.
//  Copyright (c) 2016 Steven Koposov . All rights reserved.
//

#import "MTDataManager.h"
#import "MTHTTPBinGetSampleRequest.h"

/* SHARED INSTANCE BLOCK */
//-------------------------------------------------------------------------------------
#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject;
//-------------------------------------------------------------------------------------

@implementation MTDataManager

+ (instancetype)sharedInstance {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^ {
        return [[self alloc] init];
    });
}

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}


- (void)binGetSampleRequestWithOwner:(id)classOwner
                          complition:(MTCompletionBlock)completion
                             failure:(MTFailureBlock)failure {
    MTHTTPBinGetSampleRequest *getRequest = [MTHTTPBinGetSampleRequest requestWithOwner:self];
    getRequest.completionBlock = ^(MTHTTPBinGetSampleRequest *request, NSError *error) {
        if (error == nil) {
            completion(request.response.allDictionaryData);
        } else {
            failure(request.response);
        }
    };

    [[MTDispatcher sharedInstance] processRequest:getRequest];
}

- (void)binGetSample2RequestWithOwner:(id)classOwner
                           completion:(void (^)(NSString *url,
                                                NSString *origin))completion
                              failure:(MTFailureBlock)failure {
    MTHTTPBinGetSampleRequest *getRequest = [MTHTTPBinGetSampleRequest requestWithOwner:self];
    getRequest.completionBlock = ^(MTHTTPBinGetSampleRequest *request, NSError *error) {
        if (error == nil) {
            completion(request.response.url, request.response.origin);
        } else {
            failure(request.response);
        }
    };

    [[MTDispatcher sharedInstance] processRequest:getRequest];
}

@end
