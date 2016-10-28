//
//  AppDelegate.m
//  lauch
//
//  Created by 张永强 on 16/10/28.
//  Copyright © 2016年 张永强. All rights reserved.
//

#import "AppDelegate.h"
#import "XHLaunchAd.h"
#import "ViewController.h"

//静态广告
#define ImgUrlString1 @"http://img105.job1001.com/upload/adminnew/2014-09-28/1411869604-ENEWAF1.jpg"
//动态广告
#define ImgUrlString2 @"http://c.hiphotos.baidu.com/image/pic/item/d62a6059252dd42a6a943c180b3b5bb5c8eab8e7.jpg"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    /**
     *  启动页广告
     */
    [self advertise];
    [self.window makeKeyWindow];
    
    return YES;
}
- (void)advertise {
    [XHLaunchAd showWithAdFrame:CGRectMake(0, 0, self.window.bounds.size.width,  self.window.bounds.size.height) setAdImage:^(XHLaunchAd *launchAd) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [launchAd setImageUrl:ImgUrlString1 duration:3 skipType:SkipTypeTimeText options:XHWebImageDefault completed:^(UIImage *image, NSURL *url) {
               
           } click:^{
              //图片点击回调

           }];
        });
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [launchAd setImageUrl:@"http://d.hiphotos.baidu.com/image/pic/item/14ce36d3d539b60071473204e150352ac75cb7f3.jpg" duration:2 skipType:SkipTypeTimeText options:XHWebImageDefault completed:^(UIImage *image, NSURL *url) {
//                
//            } click:^{
//                //图片点击回调
//                
//            }];
//        });
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [launchAd setImageUrl:@"http://pic.qiantucdn.com/58pic/17/80/57/94s58PICA7j_1024.jpg" duration:1 skipType:SkipTypeTimeText options:XHWebImageDefault completed:^(UIImage *image, NSURL *url) {
//                
//            } click:^{
//                //图片点击回调
//                
//            }];
//        });
        
    } showFinish:^{
        //广告展示完成回调,设置window根控制器
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    }];
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
