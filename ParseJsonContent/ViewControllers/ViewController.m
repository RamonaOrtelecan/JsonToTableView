//
//  ViewController.m
//  ParseJsonContent
//
//  Created by Ramona Ortelecan on 11/06/15.
//  Copyright (c) 2015 Ramona. All rights reserved.
//
#define jsonURL @"https://s3-us-west-2.amazonaws.com/wirestorm/assets/response.json"

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "ShowBigImageViewController.h"
#import "NSArray+Json.h"


@interface ViewController ()
@property (retain, nonatomic) NSArray *jsonContent;
@property (retain, nonatomic) IBOutlet UITableView *usersTableView;
@property (nonatomic, assign)  NSInteger selectedRow;
@end

@implementation ViewController

@synthesize jsonContent, selectedRow;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // get Json content and put it into an NSArray
    if (!self.jsonContent) {
        self.jsonContent = [[NSArray alloc] init];
        self.jsonContent = [NSArray arrayWithContentsOfFile:jsonURL];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.jsonContent count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UserCell";
       CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
            cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   
    NSDictionary *userDict = [jsonContent objectAtIndex:indexPath.row];
        cell.nameLabel.text = [userDict objectForKey:@"name"];
        cell.positionLabel.text = [userDict objectForKey:@"position"];
    
    //load small picture asynchronously
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[userDict objectForKey:@"smallpic"]]];
        UIImage * img = [UIImage imageWithData:imageData ];
        cell.userImage.image = img;
    });
       return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //retain the selected row
    self.selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"Show_big_image" sender:self];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //pass the big image url to the ShowBigImageViewController
    if ([segue.destinationViewController respondsToSelector:@selector(setBackgroundImageString:)]) {
        [segue.destinationViewController performSelector:@selector(setBackgroundImageString:)
                                              withObject:[[jsonContent objectAtIndex:selectedRow] objectForKey:@"lrgpic"]];
    }
}

@end
