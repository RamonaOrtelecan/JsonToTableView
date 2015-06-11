//
//  CustomTableViewCell.h
//  ParseJsonContent
//
//  Created by Ramona Ortelecan on 11/06/15.
//  Copyright (c) 2015 Ramona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *userImage;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *positionLabel;

@end
