//
//  ViewController.m
//  macOS-Objc
//
//  Created by nice on 25/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

#import "ViewController.h"
#import <YouboraConfigUtils_macOS/YouboraConfigUtils_macOS-Swift.h>

@interface ViewController()

@property YouboraConfigViewController *configViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.configViewController = [[YouboraConfigViewController alloc] initFromXIB];
    
    [self.configViewController insertIntoContainerWithContainerView:self.container];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
