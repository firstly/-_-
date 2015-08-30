//
//  ObsessionViewController.m
//  大创
//
//  Created by 王哲 on 15/8/30.
//  Copyright (c) 2015年 王哲. All rights reserved.
//

#import "ObsessionViewController.h"
@interface ObsessionViewController()

@end
@implementation ObsessionViewController



-(void)obssestionDetailViewController:(DetailViewController *)controller didUpdateSomethingName:(NSString *)somethingName{
    Something *something;
    if (controller.row>=0) {
        //NSFetchRequest * request=[[NSFetchRequest alloc] initWithEntityName:@"Something"];
        //something=[[self.context executeFetchRequest:request error:nil] mutableCopy][controller.row];
        something= self.somethings[controller.row];
        something.text=somethingName;
    }else{
        something=[NSEntityDescription  insertNewObjectForEntityForName:@"Something"
            inManagedObjectContext: self.context];
       // NSLog(@"aaaaa");
        something.text=controller.detailText.text;
        something.isDone=0;
        [self.somethings insertObject:something atIndex:0];
        controller.row=0;
    }
    if ([controller.detailText.text isEqualToString:@""]) {
        [self.somethings removeObjectAtIndex:controller.row];
    }
    [self.context save:nil];
    [self.tableView reloadData];
}


-(NSMutableArray *)somethings{
    if (!_somethings) {
        _somethings=[[NSMutableArray alloc] init];
    }
    return _somethings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *app= [UIApplication sharedApplication].delegate;
    self.context=app.managedObjectContext;
    NSFetchRequest * request=[[NSFetchRequest alloc] initWithEntityName:@"Something"];
    self.somethings=[[self.context executeFetchRequest:request error:nil] mutableCopy];
    // Uncomment the following line to preserve selection between presentations.
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (int i=0; i<[self.somethings count]; ++i) {
        ObsesstionCell *cell=[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        ((Something *)self.somethings[i]).isDone=[NSNumber numberWithBool:[cell.obsesstionSwitch isOn]];
    }
    [self.context save:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.somethings count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ObsesstionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Something *something;
    something =self.somethings[indexPath.row];
    
    cell.obsesstionLabel.text=something.text;
    [cell.obsesstionSwitch setOn:[something.isDone boolValue]];
    cell.row=indexPath.row;
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Something *something=self.somethings[indexPath.row];
        [self.context deleteObject:something];
        [self.somethings removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.context save:nil];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



// Override to support rearranging the table view.
/*
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 
 */
/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:([DetailViewController class])]){
        DetailViewController *dvc=(DetailViewController *)segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
        if([segue.identifier isEqualToString:@"change"]){
            dvc.detailThing=[NSString stringWithString:((Something *)self.somethings[indexPath.row]).text];
            dvc.row=indexPath.row;
            dvc.delegate=self;
        }else if ([segue.identifier isEqualToString:@"add"]){
            dvc.row=-1;
            dvc.delegate=self;
        }
    }
    
}

@end
