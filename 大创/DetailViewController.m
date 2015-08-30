//
//  DetailViewController.m
//  大创
//
//  Created by 王哲 on 15/8/30.
//  Copyright (c) 2015年 王哲. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.detailText.text=self.detailThing;
    //[self.navigationItem.leftBarButtonItem setAction:@selector(save_return:)];
    //self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"保存" style: UIBarButtonItemStyleDone target:self action:@selector(save_return:)];
    
}
-(IBAction)save_return:(id)sender{
    [self.view endEditing:YES];
    [self.delegate obssestionDetailViewController:self didUpdateSomethingName:self.detailText.text];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"" otherButtonTitles:nil];
    [alert show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
