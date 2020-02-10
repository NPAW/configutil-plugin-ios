//
//  ViewController.m
//  iOS-Objc
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

#import "ViewController.h"
#import <YouboraConfigUtils/YouboraConfigUtils-Swift.h>

@interface ViewController ()

@property YouboraConfigViewController *child;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YouboraConfigManager getOptions];
    self.child = [YouboraConfigViewController initFromXIBWithAnimatedNavigation:false];
    
    [self.child insertIntoParentWithParentViewController:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


@end
