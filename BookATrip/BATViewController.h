//
//  BATViewController.h
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BATStation.h"
#import "BATDateView.h"
#import "BATTravellersView.h"
#import "UIButton+Gradients.h"

@interface BATViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    
    BATStation *fromStation;
    BATStation *toStation;
    
    BATDateView *startDate;
    BATDateView *endDate;
    
    BATTravellersView *passengerView;
    
    UIView *classView;
}

@property IBOutlet UITableView *bookingTable;

@end
