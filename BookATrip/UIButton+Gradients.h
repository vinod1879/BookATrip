//
//  UIButton+Gradients.h
//  GolfIowa
//
//  Created by Vinod Vishwanath on 27/08/13.
//  Copyright (c) 2013 baskar balan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface UIButton(Gradients)

-(void)addGradientWithTitleColor:(UIColor*)titleColor highlightedColor:(UIColor*)highlightedColor gradientArray:(NSArray*)gradientArray cornerRadius:(BOOL)cornerRadius;

@end
