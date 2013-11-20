//
//  BATStation.m
//  BookATrip
//
//  Created by Vinod Vishwanath on 20/11/13.
//  Copyright (c) 2013 Vinod Vishwanath. All rights reserved.
//

#import "BATStation.h"

#define WIDTH 120
#define HEIGHT 75

@implementation BATStation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithTitle:(NSString *)_title description:(NSString*)_description parent:(UIView*)parent alignment:(NSTextAlignment)_alignment
{
    CGRect frame = CGRectMake(0, 0, 0, 0);
    
    self = [super initWithFrame:frame];
    if (self) {
        
        title = _title;
        description = _description;
        alignment = _alignment;
        
        [self initViewWithParent:parent];
        
    }
    return self;
}

-(void)initViewWithParent:(UIView*)parent
{
    CGSize pSize = parent.frame.size;
    int x, y=0;
    
    if(alignment == NSTextAlignmentLeft) {
        
        x=0 + 10;
    }
    else {
        
        x = pSize.width - WIDTH - 10;
    }
    
    self.frame = CGRectMake(x, y, WIDTH, HEIGHT);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 0.7 * HEIGHT)];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-bold" size:25.0f]];
    [titleLabel setTextColor:[UIColor blackColor]];
    
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.7 * HEIGHT, WIDTH, 0.3 * HEIGHT)];
    [descLabel setText:description];
    [descLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0f]];
    [descLabel setTextColor:[UIColor darkGrayColor]];
    
    [titleLabel setTextAlignment:alignment];
    [descLabel setTextAlignment:alignment];
    
    [self addSubview:titleLabel];
    [self addSubview:descLabel];
    
    [parent addSubview:self];
}


@end
