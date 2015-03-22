//
//  NSError+dssCategory.h
//  dssCategories
//
//  Created by Doug on 3/22/15.
//  Copyright (c) 2015 dssDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (dssCategory)

+ (NSError *)dss_errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
                    localizedDescription:(NSString *)desc;

@end
