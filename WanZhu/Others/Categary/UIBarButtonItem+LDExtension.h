//
//  UIBarButtonItem+LDExtension.h
//  llll
//
//  Created by lidong on 15/9/21.
//  Copyright © 2015年 msl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LDExtension)

+ (instancetype)itemWithTarget:(id)target action:(SEL)action imageNamed :(NSString *)imageName selectImageNamed:(NSString *)selImageName;

+ (instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title;
@end
