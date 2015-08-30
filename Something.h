//
//  Something.h
//  大创
//
//  Created by 王哲 on 15/8/30.
//  Copyright (c) 2015年 王哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Something : NSManagedObject

@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSString * text;

@end
