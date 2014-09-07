//
//  DemoPost.h
//  MVCDemo
//
//  Created by moxie on 14-9-6.
//  Copyright (c) 2014年 moxie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoPost : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSString *by;
@property (strong, nonatomic) NSString *points;
@property (strong, nonatomic) NSString *time;

+ (void)SNPosts:(NSString *)url;

- (id)initWithDictionary:(NSMutableDictionary *)json;

@end
