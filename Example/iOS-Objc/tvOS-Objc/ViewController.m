//
//  ViewController.m
//  tvOS-Objc
//
//  Created by nice on 25/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

#import "ViewController.h"
#import <YouboraConfigUtils/YouboraConfigUtils-Swift.h>

@interface ViewController ()

@property YouboraConfigViewController * child;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YouboraConfigManager getOptions];
    
    self.child = [YouboraConfigViewController initFromXIB];
    
    [self.child insertIntoParentWithParentViewController:self];
}


@end
