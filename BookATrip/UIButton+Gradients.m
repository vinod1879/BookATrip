//
//  UIButton+Gradients.m
//  GolfIowa
//
//  Created by Vinod Vishwanath on 27/08/13.
//  Copyright (c) 2013 baskar balan. All rights reserved.
//

#import "UIButton+Gradients.h"

@implementation UIButton(Gradients)

-(void)addGradientWithTitleColor:(UIColor*)titleColor highlightedColor:(UIColor*)highlightedColor gradientArray:(NSArray*)gradientArray cornerRadius:(BOOL)cornerRadius
{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = self.bounds;
    btnGradient.colors = gradientArray;
    
    UIImage *bgImage = [self imageWithGradientLayer:btnGradient size:self.frame.size cornerRadius:cornerRadius];
    [self setBackgroundImage:bgImage forState:UIControlStateNormal];    
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [[view layer] setCornerRadius:cornerRadius];
    [[view layer] setMasksToBounds:YES];
    view.backgroundColor = color;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(UIImage*)imageWithGradientLayer:(CAGradientLayer*)gradientLayer size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    [view.layer insertSublayer:gradientLayer atIndex:0];
    [view.layer setMasksToBounds:YES];
    [view.layer setCornerRadius:cornerRadius];
    [view.layer setBorderWidth:1.0f];
    [view.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
