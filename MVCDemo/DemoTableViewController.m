//
//  DemoTableViewController.m
//  MVCDemo
//
//  Created by moxie on 14-9-6.
//  Copyright (c) 2014年 moxie. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DemoTableViewCell.h"
//#import "DemoPost.h"
#import "AFNetworking.h"
#import "DetailViewController.h"

@interface DemoTableViewController () <UITableViewDataSource>
@property (readwrite,strong, nonatomic) NSArray *posts;
//@property (strong, nonatomic) DemoPost *post;
@end

@implementation DemoTableViewController
@synthesize posts;

- (void)reLoad
{
    NSString *url = @"http://7h2oappengine.sinaapp.com/snapi/news.php";
    /*AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success: %@", responseObject);
        if (responseObject) {
            posts = responseObject;
            [self.tableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fails");
    }];
     */
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateUI:) name:@"dataLoaded" object:nil];
    [DemoPost SNPosts:url];
    
    
 //   posts = [DemoPost SNPosts:url];
    
}

- (void)updateUI:(NSNotification *)notification
{
    //NSLog(@"noti: %@", notification);
    posts = [notification.userInfo objectForKey:@"json"];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.title = @"Demo";
    [self reLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return (NSInteger)[posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[DemoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    //NSDictionary *dict = [posts objectAtIndex:indexPath.row];
    //cell.post.title = dict.title;
    cell.post = [[DemoPost alloc]initWithDictionary: [posts objectAtIndex:indexPath.row]];
    NSLog(@"this post: %@", cell.post);
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].backgroundColor = [UIColor lightGrayColor];
    NSString *link = [[posts objectAtIndex:[indexPath row]]valueForKey:@"link"];
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    [detailVC loadWebFromLink:link];
    detailVC.title = @"Detail";
    [self.navigationController pushViewController:detailVC animated:NO];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
