//
//  NSArray+Json.h
//  ParseJsonContent
//
//  Created by Ramona Ortelecan on 11/06/15.
//  Copyright (c) 2015 Ramona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(JSONCategories)
+(NSArray *)arrayWithContentsOfFile:(NSString *)path;
@end
