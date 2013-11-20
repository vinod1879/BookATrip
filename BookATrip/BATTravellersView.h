//
//  BATTravellersView.h
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BATTravellersView : UIView {
    
    int adults, children, infants;
    NSString *title;
}

-(id)initWithTitle:(NSString*)_title parent:(UIView*)parentView adults:(int)_adults children:(int)_children infants:(int)_infants;

@end
