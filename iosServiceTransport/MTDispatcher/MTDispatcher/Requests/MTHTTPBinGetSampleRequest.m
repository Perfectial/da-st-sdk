//
//  MTHTTPBinGetSampleRequest.m
//  MTDispatcher
//
//  Created by Steven on 5/27/16.
//  Copyright © 2016 Steven. All rights reserved.
//

#import "MTHTTPBinGetSampleRequest.h"

@implementation MTHTTPBinGetSampleRequest

- (NSMutableURLRequest *)serviceURLRequest {
    NSMutableURLRequest *request = [super serviceURLRequest];

    request.URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    
    return request;
}

- (MTHTTPBinGetSampleResponse *)response {
    return (MTHTTPBinGetSampleResponse *)_response;
}

- (Class)responseClass {
    return MTHTTPBinGetSampleResponse.class;
}

- (NSString *)description {
    return NSStringFromClass(self.class);
}

@end

@implementation MTHTTPBinGetSampleResponse

- (void)parseResponse:(NSHTTPURLResponse *)networkResponse data:(NSData *)responseData error:(NSError *)error {
    [super parseResponse:networkResponse data:responseData error:error];
    
    if (error == nil) {
        _allDictionaryData = _jsonDictionary;
        _origin = _allDictionaryData[@"origin"];
        _url    = _allDictionaryData[@"url"];
    }
}

@end
