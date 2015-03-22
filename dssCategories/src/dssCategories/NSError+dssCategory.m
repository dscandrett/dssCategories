//
//  NSError+dssCategory.m
//  dssCategories
//
//  Created by Doug on 3/22/15.
//  Copyright (c) 2015 dssDigital. All rights reserved.
//

#import "NSError+dssCategory.h"

@implementation NSError (dssCategory)

+ (NSError *)dss_errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
        localizedDescription:(NSString *)desc {
    return [NSError errorWithDomain:domain
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey:desc}];
}

@end
