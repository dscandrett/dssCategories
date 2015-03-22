//
//  NSObject+dssCategory.m
//
//  The MIT License (MIT)
//
//  Copyright (c) 2008-20015 Doug Scandrett
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "NSObject+dssCategory.h"

@implementation NSObject (dssCategory)

#pragma mark Storage Convenience
+ (void)dss_storeObject:(NSObject *)root withKey:(NSString *)key {
    
    // caller must pass unique key
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:root];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
}

+ (NSObject *)dss_loadObjectOfClass:(Class)aClass FromKey:(NSString *)key {
    
    NSData *storedData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSObject *temp = nil;
    
    if (storedData != nil) {
        
        temp = [NSKeyedUnarchiver unarchiveObjectWithData:storedData];
        
        if (temp) {
            if (![temp isKindOfClass:aClass]) {
                return [[aClass alloc] init];
            }
            if ([temp respondsToSelector:@selector(mutableCopyWithZone:)]) {
                return [temp mutableCopy];
            } else if([temp respondsToSelector:@selector(copyWithZone:)]) {
                return [temp copy];
            } else {
                return temp;
            }
            
        } else {
            return [[aClass alloc] init];
        }
    } else {
        return [[aClass alloc] init];
    }
}

@end
