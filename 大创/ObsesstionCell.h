//
//  ObsesstionCell.h
//  大创
//
//  Created by 王哲 on 15/8/30.
//  Copyright (c) 2015年 王哲. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObsesstionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *obsesstionSwitch;
@property (nonatomic) NSInteger row;
@property (weak, nonatomic) IBOutlet UILabel *obsesstionLabel;

@end
