//
//  ViewController.m
//  iOS-Objc
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

#import "ViewController.h"
#import <YouboraConfigUtils/YouboraConfigUtils.h>

@interface ViewController ()

@property YouboraConfigViewController *child;
@property UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.child = [[YouboraConfigViewController alloc] init];
    self.containerView = [[UIView alloc] init];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setContainerView];
    [self insertChildViewController];
}

#pragma mark: Aux Methods

-(void)setContainerView {
    [self.view addSubview:self.containerView];
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat topSpace = [UIApplication sharedApplication].statusBarFrame.size.height + ( self.navigationController ? self.navigationController.navigationBar.frame.size.height : [[NSNumber numberWithFloat:0] floatValue]);
    
    CGFloat bottomSpace = self.tabBarController ? self.tabBarController.tabBar.frame.size.height : [[NSNumber numberWithFloat:0] floatValue];
    
    [self.view addConstraints:@[
        [self.view.topAnchor constraintEqualToAnchor:self.containerView.topAnchor constant:-topSpace],
        [self.view.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor constant:bottomSpace],
        [self.view.leftAnchor constraintEqualToAnchor:self.containerView.leftAnchor constant:0],
        [self.view.rightAnchor constraintEqualToAnchor:self.containerView.rightAnchor constant:0]
    ]];
}

-(void)insertChildViewController {
    self.child.view.frame = self.containerView.frame;
    [self.containerView addSubview:self.child.view];
    
    [self.child didMoveToParentViewController:self];
}

@end
