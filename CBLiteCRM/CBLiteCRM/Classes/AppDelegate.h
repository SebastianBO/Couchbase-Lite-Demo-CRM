//
//  AppDelegate.h
//  CBLiteCRM
//
//  Created by Danil on 26/11/13.
//  Copyright (c) 2013 Danil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBLSyncManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CBLDatabase *database;
@property (strong, nonatomic) CBLSyncManager *cblSync;

- (void)loginAndSync: (void (^)())complete asAdmin:(BOOL)asAdmin;

@end
