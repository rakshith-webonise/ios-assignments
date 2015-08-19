//
//  Person.h
//  AssignmentFive
//
//  Created by weboniselab1 on 11/08/2015.
//  Copyright (c) 2015 weboniselab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;

@end
