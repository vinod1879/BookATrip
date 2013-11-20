//
//  BATStation.h
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BATStation : UIView {
    
    NSTextAlignment alignment;
    NSString *title;
    NSString *description;
}



-(id)initWithTitle:(NSString *)_title description:(NSString*)_description parent:(UIView*)parent alignment:(NSTextAlignment)_alignment;

@end
