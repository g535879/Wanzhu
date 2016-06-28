//
//  MS_BasicViewController.m
//  weibu
//
//  Created by 古玉彬 on 16/1/14.
//  Copyright © 2016年 msql. All rights reserved.
//

#import "MS_BasicViewController.h"

@interface MS_BasicViewController ()
/**
 *  网络连接状态
 */
@property (nonatomic, assign) BOOL isNetWork;

@end

@implementation MS_BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //没有网络
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isnotNetWork) name:isnetWorkNotificationNo object:nil];
    
    
    //有网络
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isNetWorkYes) name:isnetWorkNotificationYes object:nil];
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark - private Method
//网络连接失败
- (void)isnotNetWork {
    
    self.isNetWork = NO;
    
}

//网络连接成功
- (void)isNetWorkYes {
    
    self.isNetWork = YES;
    
}


- (void)showSuccess:(NSString *)successMsg {
    [SVProgressHUD showSuccessWithStatus:successMsg];
}


- (void)showError:(NSString *)errorMsg {
    
    [SVProgressHUD showErrorWithStatus:errorMsg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
