//
//  DemoTableViewCell.h
//  MVCDemo
//
//  Created by moxie on 14-9-6.
//  Copyright (c) 2014年 moxie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoPost.h"

@interface DemoTableViewCell : UITableViewCell
@property (strong, nonatomic) DemoPost *post;
@end
