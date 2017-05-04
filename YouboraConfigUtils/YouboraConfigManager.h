//
//  YouboraConfigMAnager.h
//  AVPlayerAdapterExample
//
//  Created by Joan on 02/05/2017.
//  Copyright © 2017 NPAW. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YBOptions;

@interface YouboraConfigManager : NSObject

+ (void) save;
+ (void) reset;
+ (YBOptions *) getOptions;

@end
