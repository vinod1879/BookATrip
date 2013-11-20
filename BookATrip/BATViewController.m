//
//  BATViewController.m
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import "BATViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BATViewController ()

@end

@implementation BATViewController

@synthesize bookingTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)initView
{
    //[[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x067AB5)];
    [bookingTable setScrollEnabled:NO];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height = 44;
    
    switch (indexPath.row) {
        case 0:
            height = 88;
            break;
            
        case 1:
            height = 88;
            break;
            
        case 2:
            
            height = 88;
            break;
            
        case 4:
            height = 250;
            
        default:
            break;
    }
    
    
    return height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    switch(indexPath.row) {
            
        case 0:
            [cell.contentView addSubview:[self routeView]];
            break;
        case 1:
            [cell.contentView addSubview:[self dateView]];
            break;
        case 2:
            [cell.contentView addSubview:[self travellersView]];
            break;
        case 3:
            [cell.contentView addSubview:[self travelClass]];
            break;
        case 4:
            [cell.contentView addSubview:[self glossyButton]];
            break;
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(UIView*)routeView
{
    UIView *theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    
    fromStation = [[BATStation alloc] initWithTitle:@"DEL" description:@"New Delhi" parent:theView alignment:NSTextAlignmentLeft];
    
    UIImageView *flightImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flight"]];
    flightImg.frame = CGRectMake(140, 14, 40, 60);
    [flightImg setContentMode:UIViewContentModeScaleAspectFit];
    [theView addSubview:flightImg];
    
    toStation = [[BATStation alloc] initWithTitle:@"BLR" description:@"Bangalore" parent:theView alignment:NSTextAlignmentRight];
    
    
    return theView;
}

-(UIView*)dateView
{
    UIView *theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = 2013;
    dateComponents.month = 11;
    dateComponents.day = 21;
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    
    NSDate *date1 = [gregorian dateFromComponents: dateComponents];
    dateComponents.day = 25;
    NSDate *date2 = [gregorian dateFromComponents:dateComponents];
    
    startDate = [[BATDateView alloc] initWithTitle:@"Depart" date:date1 parent:theView alignment:NSTextAlignmentLeft];
    
    endDate = [[BATDateView alloc] initWithTitle:@"Return" date:date2 parent:theView alignment:NSTextAlignmentRight];

    return theView;
}

-(UIView*)travellersView
{
    
    UIView *theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    
    passengerView = [[BATTravellersView alloc] initWithTitle:@"Travellers" parent:theView adults:1 children:1 infants:1];
    
    return theView;
    
}

-(UIView*)travelClass
{
    UIView *theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:theView.frame];
    [label setText:@"Business Class"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18.0f]];
    
    [theView addSubview:label];
    
    return theView;
}

-(UIView*)glossyButton
{
    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeCustom];
    theButton.frame = CGRectMake(70, 50, 180, 35);
    [theButton setTitle:@"Search Flights" forState:UIControlStateNormal];
    [theButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
    NSArray *gArray = [NSArray arrayWithObjects:(id)[UIColorFromRGB(0x046Aa5) CGColor], (id)[UIColorFromRGB(0x144A75) CGColor], nil];
    
    [theButton addGradientWithTitleColor:[UIColor whiteColor] highlightedColor:[UIColor grayColor] gradientArray:gArray cornerRadius:6.0f];
    
    return theButton;
}



@end
