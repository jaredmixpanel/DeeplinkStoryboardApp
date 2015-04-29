//
//  AppDelegate.m
//  DeeplinkStoryboardApp
//
//  Created by Jared McFarland on 4/29/15.
//  Copyright (c) 2015 Jared McFarland. All rights reserved.
//

#import "AppDelegate.h"
#import "Page1ViewController.h"
#import "Page2ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    if([[url host] isEqualToString:@"deeplink"]) {
        if([[url path] isEqualToString:@"/page1"]) {
            // Insantiate a view controller by its storyboard ID and push it onto a navigation controller stack
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            UIViewController *page1ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page1"];
            UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
            [navController pushViewController:page1ViewController animated:YES];
            
        } else if ([[url path] isEqualToString:@"/page2"]) {
            // Alternatively perform a segue with its identifier
            [self.window.rootViewController performSegueWithIdentifier:@"page2" sender:self];
            
        } else {
            return NO;
        }
    } else {
        return NO;
    }
    return YES;
}

@end
