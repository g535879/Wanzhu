//
//  MS_TabBarController.m
//  Air
//
//  Created by Mrxiaowu on 16/6/6.
//  Copyright © 2016年 Mrxiaowu. All rights reserved.
//

#import "MS_TabBarController.h"
#import "MS_HomeViewController.h"
#import "MS_CommunicationViewController.h"
#import "MS_AuctionViewController.h"
#import "MS_FindViewController.h"
#import "MS_MeViewController.h"
#import "UIImage+ColorImage.h"

@interface MS_TabBarController ()

@end

@implementation MS_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    
    NSMutableArray * vcArray = [@[] mutableCopy];
    
    [vcArray addObject:NSStringFromClass([MS_HomeViewController class])];
    [vcArray addObject:NSStringFromClass([MS_CommunicationViewController class])];
    [vcArray addObject:NSStringFromClass([MS_AuctionViewController class])];
    [vcArray addObject:NSStringFromClass([MS_FindViewController class])];
    [vcArray addObject:NSStringFromClass([MS_MeViewController class])];
    
    NSArray * titleArray = @[@"首页",@"交流区",@"交易区",@"发现",@"我的"];
    
    NSArray * imageArray = @[@""];
    
    NSArray * selectedArray = @[@""];
    
    for (int i = 0; i < vcArray.count; i++) {
        
        NSString * vcStr = vcArray[i];
        
        UIViewController * vc = [[NSClassFromString(vcStr) alloc] init];
        [self addChildVc:vc title:titleArray[i] image:imageArray[0] selectedImage:selectedArray[0]];
    }
    
    //tabbar 的分割线颜色
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:MSHexColor(@"F8F8F8")]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:MSHexColor(@"FFFFFF")]];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MSHexColor(@"999999"), NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MSHexColor(@"481F13"), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];


}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    MS_NavigationController *nav = [[MS_NavigationController alloc] initWithRootViewController:childVc];
    nav.navigationBarHidden = YES;
    // 添加为子控制器
    [self addChildViewController:nav];
    
    
    // 设置子控制器的文字
    childVc.title = title;
    if ([title isEqualToString:@"交易区"]) {
        

        childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-11, 0, 11, 0);
    }else{
    
        childVc.title = title;

    }
    
    

    // 设置子控制器的图片
//    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
}

@end
