//
//  ViewController.m
//  CoreData
//
//  Created by Thamil Selvan V on 06/07/17.
//  Copyright © 2017 Thamil Selvan V. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Employee.h"

#define EMPLOYEE_ENTITY @"Employee"

@interface ViewController ()
@property(nonatomic,strong) NSManagedObjectContext *managedObjContext;
@property(nonatomic,strong) NSEntityDescription *entityDescription;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _managedObjContext = [[AppDelegate instance] managedObjContext];
    Employee *employee = [self employeeInstance];
    employee.name = @"Thamil";
    employee.age = 31;
    employee.gender = YES;
    
    NSError *error = nil;
    if (![_managedObjContext save:&error]) {
        
    }
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:EMPLOYEE_ENTITY];
    NSArray *objects = [_managedObjContext executeFetchRequest:fetchRequest error:&error];
    [objects enumerateObjectsUsingBlock:^(NSManagedObject *object, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([object isKindOfClass:[Employee class]]) {
            Employee *employee = (Employee*)object;
            NSLog(@"name: %@ gender: %@ age: %d",employee.name,(employee.gender)? @"male": @"female",(int)employee.age);
        }
    }];
}

-(Employee*)employeeInstance {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:EMPLOYEE_ENTITY inManagedObjectContext:_managedObjContext];
    Employee *employee = [[Employee alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_managedObjContext];
    return employee;
}

@end
