//
//  UIBarButtonItem+LDExtension.m
//  llll
//
//  Created by lidong on 15/9/21.
//  Copyright © 2015年 msl. All rights reserved.
//

#import "UIBarButtonItem+LDExtension.h"

@implementation UIBarButtonItem (LDExtension)

+ (instancetype)itemWithTarget:(id)target action:(SEL)action imageNamed :(NSString *)imageName selectImageNamed:(NSString *)selImageName
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selImageName] forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    // sel如果传入为nil, 默认就是不调用方法
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button sizeToFit];
    
    // sel如果传入为nil, 默认就是不调用方法
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
