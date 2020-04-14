//
//  UIView+UG.h
//  Nextcloud
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019 TWS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UG)

/**
 * 设置圆角
 */
- (void)ug_radius:(CGFloat)radius;
/**
 * 设置边框与边框颜色
 */
-(void)ug_borderColor:(UIColor *)acolor width:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END