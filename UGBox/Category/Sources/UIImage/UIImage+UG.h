//
//  UIImage+UG.h
//  LHCloud
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019 admin. All rights reserved.
//




NS_ASSUME_NONNULL_BEGIN


@interface UIImage (UG)

//根据给定颜色返回图片
- (UIImage *)imageWithColor:(UIColor *)color;

/**
 * 根据给定CGSize 返回图片
 * \return 改变尺寸后的图
 */
- (UIImage *)reSize:(CGSize)reSize;

// 图片裁剪圆角
- (UIImage *)ug_cornerRadius:(CGFloat)cornerRadius;
@end

NS_ASSUME_NONNULL_END
