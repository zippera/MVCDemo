//
//  DemoTableViewCell.m
//  MVCDemo
//
//  Created by moxie on 14-9-6.
//  Copyright (c) 2014年 moxie. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "DemoPost.h"

@implementation DemoTableViewCell
@synthesize post = _post;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // 创建 cell 的时候调用
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
// cell.post=... 的时候调用
- (void)setPost:(DemoPost *)post {
    _post = post;
    // AFNetwork 返回的是 nscfdictionary,取值用 valueforkey
    //http://stackoverflow.com/questions/7165796/nscfdictionary-length-unrecognized-selector
    self.textLabel.text = _post.title;
    self.detailTextLabel.text = _post.link;
    //self.textLabel.text = [_post valueForKey:@"title"];
    //self.detailTextLabel.text = [_post valueForKey:@"link"];
    self.imageView.image = [UIImage imageNamed:@"profile-image-placeholder"];
    [self setNeedsLayout];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
