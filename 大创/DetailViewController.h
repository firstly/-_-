//
//  DetailViewController.h
//  大创
//
//  Created by 王哲 on 15/8/30.
//  Copyright (c) 2015年 王哲. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Something;
@protocol ObssestionDetailViewcontrollerDelegate ;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *detailText;

@property(strong,nonatomic) NSString *detailThing;
@property(strong,nonatomic) id<ObssestionDetailViewcontrollerDelegate> delegate;
@property(nonatomic) NSInteger row;
@end


@protocol ObssestionDetailViewcontrollerDelegate

- (void)obssestionDetailViewController:(DetailViewController *)controller
                didUpdateSomethingName:(NSString *)somethingName;
@end