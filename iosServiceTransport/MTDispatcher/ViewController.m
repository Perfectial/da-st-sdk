//
//  ViewController.m
//  MTDispatcher
//
//  Created by Steven on 6/18/15.
//  Copyright (c) 2015 Steven. All rights reserved.
//

#import "ViewController.h"
#import "MTDataManager.h"
#import "MTDispatcher.h"

@interface ViewController ()
@property (strong, nonatomic) MTDataManager *dataManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.dataManager binGetSampleRequestWithOwner:self
                                        complition:^(id responseObject, ...) {
                                            NSLog(@"responseObject:%@",responseObject);
                                        } failure:^(id returnedObject, ...) {
                                            NSLog(@"returnedObject:%@",returnedObject);
                                        }];

    [self.dataManager binGetSample2RequestWithOwner:self
                                         completion:^(NSString *url, NSString *origin) {
                                             NSLog(@"url:%@ \n origin:%@",url,origin);
                                         } failure:^(id returnedObject, ...) {
                                             NSLog(@"returnedObject:%@",returnedObject);
                                         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Manager

- (MTDataManager *)dataManager {
    if (!_dataManager) {
        _dataManager = [MTDataManager sharedInstance];
    }
    return _dataManager;
}

@end
