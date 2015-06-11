//
//  NSArray+Json.m
//  ParseJsonContent
//
//  Created by Ramona Ortelecan on 11/06/15.
//  Copyright (c) 2015 Ramona. All rights reserved.
//

#import "NSArray+Json.h"

@implementation NSArray(JSONCategories)

+(NSArray *)arrayWithContentsOfFile:(NSString *)path {
    NSData* data = [NSData dataWithContentsOfURL:
                    [NSURL URLWithString: path] ];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end