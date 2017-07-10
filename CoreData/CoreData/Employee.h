//
//  Employee.h
//  CoreData
//
//  Created by Thamil Selvan V on 06/07/17.
//  Copyright © 2017 Thamil Selvan V. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Employee : NSManagedObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) BOOL gender;
@property(nonatomic,assign) NSInteger age;
@end
