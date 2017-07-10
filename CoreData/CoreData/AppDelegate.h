//
//  AppDelegate.h
//  CoreData
//
//  Created by Thamil Selvan V on 06/07/17.
//  Copyright © 2017 Thamil Selvan V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSManagedObjectContext *managedObjContext;

- (void)saveContext;
+ (AppDelegate*)instance;

@end


