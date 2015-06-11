//
//  ShowBigImageViewController.m
//  ParseJsonContent
//
//  Created by Ramona Ortelecan on 11/06/15.
//  Copyright (c) 2015 Ramona. All rights reserved.
//

#import "ShowBigImageViewController.h"

@interface ShowBigImageViewController ()
@property(retain, nonatomic) IBOutlet UIImageView *userBigPicImageView;
@end

@implementation ShowBigImageViewController
@synthesize userBigPicImageView, backgroundImageString;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_async(dispatch_get_main_queue(), ^{
    
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.backgroundImageString]];
        UIImage * img = [UIImage imageWithData:imageData ];
        self.userBigPicImageView.image = img;
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)setBackgroundImageString:(NSString *)backgroundImageString{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:backgroundImageString]];
//        UIImage * img = [UIImage imageWithData:imageData ];
//        self.userBigPicImageView.image = img;
//    });
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
