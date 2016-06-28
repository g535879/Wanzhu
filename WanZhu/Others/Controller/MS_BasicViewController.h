//
//  MS_BasicViewController.h
//  weibu
//
//  Created by 古玉彬 on 16/1/14.
//  Copyright © 2016年 msql. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MS_BasicDataControllerl.h"


@interface MS_BasicViewController : UIViewController


/**
 *  显示成功消息
 *
 *  @param successMsg <#successMsg description#>
 */
- (void)showSuccess:(NSString *)successMsg;

/**
 *  错误消息
 *
 *  @param errorMsg <#errorMsg description#>
 */
- (void)showError:(NSString *)errorMsg;
@end
