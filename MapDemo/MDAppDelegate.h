//
//  MDAppDelegate.h
//  MapDemo
//
//  Created by Ulrich Zurucker on 6/13/13.
//  Copyright (c) 2013 Ulrich Zurucker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDViewController;

@interface MDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MDViewController *viewController;

@end
