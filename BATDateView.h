//
//  BATDateView.h
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BATDateView : UIView {
    
    NSString *title;
    NSDate *date;
    NSTextAlignment alignment;
}

-(id)initWithTitle:(NSString *)_title date:(NSDate*)_date parent:(UIView*)parent alignment:(NSTextAlignment)_alignment;

@end
