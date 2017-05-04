//
//  YouboraConfigMAnager.m
//  AVPlayerAdapterExample
//
//  Created by Joan on 02/05/2017.
//  Copyright © 2017 NPAW. All rights reserved.
//

#import "YouboraConfigManager.h"

#import <YouboraLib/YouboraLib.h>

@implementation YouboraConfigManager

static YBOptions * options = nil;

+ (void) save {
    if (options != nil) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:options];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"youborasettings"];
    }
}

+ (void) reset {
    options = [YBOptions new];
    [YouboraConfigManager save];
}

+ (YBOptions *) getOptions {
    
    if (options == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"youborasettings"];
        
        if (data == nil) {
            [self reset];
        } else {
            options = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    }
    
    return options;
}

@end
