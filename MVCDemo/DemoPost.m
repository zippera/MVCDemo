//
//  DemoPost.m
//  MVCDemo
//
//  Created by moxie on 14-9-6.
//  Copyright (c) 2014年 moxie. All rights reserved.
//

#import "DemoPost.h"
#import "AFNetworking.h"


@interface DemoPost()
@end

@implementation DemoPost
- (id)initWithDictionary:(NSMutableDictionary *)json
{
    // json -> DemoPost
    if(self = [super init])
    {
        //[self init];
        [self setValuesForKeysWithDictionary:json];
    }
    return  self;
}


+ (void)SNPosts:(NSString *)url
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success");
        if (responseObject) {
            //NSLog(@"result:%@", responseObject);
            //NSLog(@"num:%d", [responseObject count]);
            [[NSNotificationCenter defaultCenter]postNotificationName:@"dataLoaded" object:self userInfo:[NSDictionary dictionaryWithObject:responseObject forKey:@"json"]];
            //posts = responseObject;
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fails");
    }];
}

@end
