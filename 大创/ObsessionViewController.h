//
//  ObsessionViewController.h
//  大创
//
//  Created by 王哲 on 15/8/30.
//  Copyright (c) 2015年 王哲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Something.h"
#import "ObsesstionCell.h"

@interface ObsessionViewController : UITableViewController <ObssestionDetailViewcontrollerDelegate>

@property(strong,nonatomic) NSMutableArray *somethings;
@property(strong,nonatomic) NSManagedObjectContext* context;
@end
