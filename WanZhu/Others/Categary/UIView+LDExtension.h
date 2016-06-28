//
//  UIView+LDExtension.h
//  CheDou
//
//  Created by lidong on 15/10/9.
//  Copyright © 2015年 location97. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LDExtension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

// 控件最右边那条线的x值(maxX)
@property (nonatomic, assign) CGFloat right;
// 控件最下边那条线的y值(maxY)
@property (nonatomic, assign) CGFloat bottom;
// 控件最左边那条线的x值(minX)
@property (nonatomic, assign) CGFloat left;
// 控件最上边那条线的y值(minY)
@property (nonatomic, assign) CGFloat top;

+ (instancetype)viewFromXib;

@end
