//
//  BATDateView.m
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import "BATDateView.h"

@implementation BATDateView

#define WIDTH 130
#define HEIGHT 75

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithTitle:(NSString *)_title date:(NSDate*)_date parent:(UIView*)parent alignment:(NSTextAlignment)_alignment
{
    CGRect frame = CGRectMake(0, 0, 0, 0);
    
    self = [super initWithFrame:frame];
    if (self) {
        
        title = _title;
        date = _date;
        alignment = _alignment;
        
        [self initViewWithParent:parent];
        
    }
    return self;
}

-(void)initViewWithParent:(UIView*)parent
{
    CGSize pSize = parent.frame.size;
    int x, x2, y=0;
    UIView *borderView;
    
    if(alignment == NSTextAlignmentLeft) {
        
        x=0 + 30;
        x2 = WIDTH/2 - 10;
        
        borderView = [[UIView alloc] initWithFrame:CGRectMake(WIDTH-1, 0, 0.5, pSize.height)];
    }
    else {
        
        x = pSize.width - WIDTH - 30;
        x2 = 0 + 10;
        
        borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, pSize.height)];
    }
    
    [borderView setBackgroundColor:[UIColor grayColor]];
    [self addSubview:borderView];
    
    self.frame = CGRectMake(x, y, WIDTH, HEIGHT);
    
    NSString *dayStr, *monthStr, *dateStr;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [df setDateFormat:@"EEE"];

    
    dayStr = [NSString stringWithFormat:@"%@",
              [df stringFromDate:date]];
    
    [df setDateFormat:@"MMM"];
    
    monthStr = [NSString stringWithFormat:@"%@",
                [df stringFromDate:date]];
    
    [df setDateFormat:@"dd"];
    
    dateStr = [NSString stringWithFormat:@"%@",
               [df stringFromDate:date]];
    
    UILabel *titleLabel, *dayLabel, *monthLabel, *dateLabel;
    
    titleLabel = [[UILabel alloc] init];
    dayLabel = [[UILabel alloc] init];
    monthLabel = [[UILabel alloc] init];
    dateLabel = [[UILabel alloc] init];
    [titleLabel setText:title];
    [dayLabel setText:dayStr];
    [monthLabel setText:monthStr];
    [dateLabel setText:dateStr];
    
    
    titleLabel.frame = CGRectMake(0, y, WIDTH, 0.3*HEIGHT);
    dayLabel.frame = CGRectMake(0, 0.3*HEIGHT, WIDTH, 0.5*HEIGHT);
    monthLabel.frame = CGRectMake(0, 0.8*HEIGHT, WIDTH, 0.2*HEIGHT);
    dateLabel.frame = CGRectMake(x2, 0.3*HEIGHT, WIDTH/2, 0.7*HEIGHT);
    
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0f]];
    [dayLabel setFont:[UIFont fontWithName:@"Helvetica" size:18.0f]];
    [monthLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0f]];
    [dateLabel setFont:[UIFont fontWithName:@"Helvetica-bold" size:35.0f]];
    
    [titleLabel setTextAlignment:alignment];
    [dayLabel setTextAlignment:alignment];
    [monthLabel setTextAlignment:alignment];
    [dateLabel setTextAlignment:alignment];
    
    [titleLabel setTextColor:[UIColor orangeColor]];
    [monthLabel setTextColor:[UIColor lightGrayColor]];
    
    
    [self addSubview:titleLabel];
    [self addSubview:dayLabel];
    [self addSubview:monthLabel];
    [self addSubview:dateLabel];
    
    [parent addSubview:self];
}

@end
